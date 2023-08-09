local Utils = require('modules.shared')

local qrs = {}

-- Check if Player is Authorized to Lock/Unlock Door --
function qrs.IsAuthorized(DOORINFO)
	local src = source
	local Player = QRCore.Functions.GetPlayer(src)
	local callback = false

	if DOORINFO.jobs then
		if type(DOORINFO.jobs) == 'table' then
			for _,x in pairs(DOORINFO.jobs) do
				if Player.PlayerData.job.name == x then
					callback = true
					break
				end
			end
		elseif type(DOORINFO.jobs) == 'string' then
			if Player.PlayerData.job.name == DOORINFO.jobs then
				callback = true
			end
		end
	end

	if DOORINFO.gangs then
		if type(DOORINFO.gangs) == 'table' then
			for _,x in pairs(DOORINFO.gangs) do
				if Player.PlayerData.gang.name == x then
					callback = true
					break
				end
			end
		elseif type(DOORINFO.jobs) == 'string' then
			if Player.PlayerData.gang.name == DOORINFO.gangs then
				callback = true
			end
		end
	end

	return callback
end

-- Update Door State --
function qrs.UpdateState(ID, STATE)
    local src = source
	local Player = QRCore.Functions.GetPlayer(src)
	local callback = false
	if not Player then return callback end
	if type(ID) ~= 'number' then return callback end
	if not qrs.IsAuthorized(Doors.List[ID]) then return callback end

	local PlayerCoords = GetEntityCoords(GetPlayerPed(src))
    local DoorCoords

	if Doors.List[ID].double then
		DoorCoords = ((Doors.List[ID].double[1].objCoords + Doors.List[ID].double[2].objCoords)/2)
	else
		DoorCoords = Doors.List[ID].objCoords
	end

	local dist = #(DoorCoords - PlayerCoords)

    if dist <= Doors.List[ID].distance then
		TriggerClientEvent('qr-doorlock:client:SyncDoorState', -1, ID, STATE)
		Doors.List[ID].locked = STATE
		callback = true

		Utils.Debug('Door State', 'Door ID: '..ID..' | Locked: '..tostring(STATE))
	end
	return callback
end

return qrs