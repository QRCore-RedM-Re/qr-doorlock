local DoorPoints = {}
local Shown = false
local Key = QRCore.Shared.GetKey(Config.KeyPress)
local inAnim = false
local SpamProtect = false
local SyncedDoors = {}

function AddDoorToSystemNew(DOOR, B1, B2, B3, THREADID, INT, B6) return Citizen.InvokeNative(0xD99229FE93B46286, DOOR, B1, B2, B3, THREADID, INT, B6) end
function DoorSystemSetDoorState(DOOR, INT) return Citizen.InvokeNative(0x6BAB9442830C7F53, DOOR, INT) end
function DoorSystemForceShut(DOOR, BOOL) return Citizen.InvokeNative(0x276AAF0F1C7F2494, DOOR, BOOL) end

local qrc = {}

-- Create All Doors --
function qrc.CreateDoors()
    SyncedDoors = lib.callback.await('qr-doorlock:server:SyncDoors', 1000)
    for x = 1, #SyncedDoors do
        local isDouble = SyncedDoors[x].double
        qrc.DoorPoint(x)
        if isDouble then
            for i = 1, 2 do
                for q = 1, #isDouble do
                    local doorInfo = isDouble[q]
                    AddDoorToSystemNew(doorInfo.doorid, 1, 1, 0, 0, 0, 0)
                    DoorSystemSetDoorState(doorInfo.doorid, 4, false, false)
                    DoorSystemSetDoorState(doorInfo.doorid, SyncedDoors[x].locked, false, false)
					DoorSystemSetAutomaticRate(doorInfo.doorid, 10.0, false, false)
					if state and not IsDoorClosed(doorInfo.doorid) then DoorSystemForceShut(doorInfo.doorid) end
                end
            end
        else
            AddDoorToSystemNew(SyncedDoors[x].doorid, 1, 1, 0, 0, 0, 0)
		    DoorSystemSetDoorState(SyncedDoors[x].doorid, 4, false, false)
		    DoorSystemSetDoorState(SyncedDoors[x].doorid, SyncedDoors[x].locked, false, false)
			DoorSystemSetAutomaticRate(SyncedDoors[x].doorid, 10.0, false, false)
			if state and not IsDoorClosed(SyncedDoors[doorID].doorid) then DoorSystemForceShut(SyncedDoors[doorID].doorid) end
        end
    end

	for _, x in pairs(Doors.UnlockedDoors) do
		AddDoorToSystemNew(x, 1, 1, 0, 0, 0, 0)
		DoorSystemSetDoorState(x, 4, false, false)
		DoorSystemSetDoorState(x, 0, false, false)
	end
end

-- Sync Door State --
function qrc.SyncDoor(doorID, state)
    SyncedDoors[doorID].locked = state
    if SyncedDoors[doorID].double then
        for x = 1, 2 do
            local door = SyncedDoors[doorID].double[x].doorid
            DoorSystemSetDoorState(door, state, false, false)
			if state and not IsDoorClosed(door) then DoorSystemForceShut(door) end
        end
    else
        DoorSystemSetDoorState(SyncedDoors[doorID].doorid, state, false, false)
		if state and not IsDoorClosed(SyncedDoors[doorID].doorid) then DoorSystemForceShut(SyncedDoors[doorID].doorid) end
    end
end

function qrc.HideText()
	Shown = false
	lib.hideTextUI()
end

-- Create Door Point --
function qrc.DoorPoint(DOOR)
	local maxDist = SyncedDoors[DOOR].distance
	local isDouble = SyncedDoors[DOOR].double
	local coords
	if isDouble then
		coords = ((isDouble[1].objCoords + isDouble[2].objCoords)/2)
	else
		coords = SyncedDoors[DOOR].objCoords
	end

	local NewPoint = lib.points.new({
		coords = coords,
		distance = maxDist,
	})

	function NewPoint:onEnter()
		if LastDoor ~= DOOR then LastDoor = DOOR end
	end

	function NewPoint:onExit()
		qrc.HideText()
	end

	function NewPoint:nearby()
		if self.currentDistance < maxDist then
			if not Shown then
				local locked
				if SyncedDoors[DOOR].locked then locked = 'fas fa-lock' else locked = 'fas fa-unlock' end
				lib.showTextUI('', { icon = locked, position = Config.TextPosition })
				Shown = true
			end

			if IsControlJustReleased(0, Key) and not SpamProtect then
				local state = not SyncedDoors[DOOR].locked
				qrc.ToggleDoor(DOOR, state)
			end
		end
	end
	DoorPoints[#DoorPoints+1] = NewPoint
end

-- Remove All Door Points (Cleanup) --
function qrc.RemovePoints()
	if Shown then qrc.HideText() end
	for x = 1, #DoorPoints do
		DoorPoints[x]:remove()
	end
end

-- Anim & Toggle State --
function qrc.ToggleDoor(DOOR, STATE)
	SpamProtect = true

	qrc.Anim(DOOR)
	local Toggle = lib.callback.await('qr-doorlock:server:UpdateState', false, DOOR, STATE)

	SpamProtect = false
end

-- Lock / Unlock Anim --
function qrc.Anim(ID)
    local ped = cache.ped
	local prop_name = 'P_KEY02X'

	local x,y,z = table.unpack(GetEntityCoords(ped, true))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")

	qrc.HideText()
	lib.requestAnimDict('script_common@jail_cell@unlock@key')
	Wait(100)
	inAnim = true
	TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
	Wait(750)
	AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
	Wait(1750)
	ClearPedSecondaryTask(ped)
	DeleteObject(prop)
	inAnim = false
end

return qrc