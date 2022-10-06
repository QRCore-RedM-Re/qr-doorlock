
local DoorInfo	= {}

RegisterServerEvent('qr-doorlock:updatedoorsv')
AddEventHandler('qr-doorlock:updatedoorsv', function(doorID, state, cb)
    local src = source
	local Player = exports['qr-core']:GetPlayer(src)
	if not IsAuthorized(Player.PlayerData.job.name, Config.DoorList[doorID]) then
		TriggerClientEvent('QRCore:Notify', src, 9, Lang:t("error.nokey"), 5000, 0, 'mp_lobby_textures', 'cross', 'COLOR_WHITE')
            return
        else
            TriggerClientEvent('qr-doorlock:changedoor', src, doorID, state)
        end
end)

RegisterServerEvent('qr-doorlock:updateState')
AddEventHandler('qr-doorlock:updateState', function(doorID, state, cb)
    local src = source
	local Player = exports['qr-core']:GetPlayer(src)
	if type(doorID) ~= 'number' then
			return
		end
		if not IsAuthorized(Player.PlayerData.job.name, Config.DoorList[doorID]) then
			return
		end
		DoorInfo[doorID] = {}
		TriggerClientEvent('qr-doorlock:setState', -1, doorID, state)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.authorizedJobs) do
		if job == jobName then
			return true
		end
	end
	return false
end
