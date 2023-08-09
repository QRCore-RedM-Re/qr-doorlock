local qrc = require('modules.client')

-- Set State for Specific Door --
RegisterNetEvent('qr-doorlock:client:SyncDoorState', function(doorID, state) qrc.SyncDoor(doorID, state) end)

-- Player / Resource Handlers --
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then qrc.CreateDoors() end end)
AddEventHandler('onResourceStop', function(resource) if resource == GetCurrentResourceName() then qrc.RemovePoints() end end)
RegisterNetEvent('QRCore:Client:OnPlayerLoaded', function() qrc.CreateDoors() end)
RegisterNetEvent('QRCore:Client:OnPlayerUnload', function() qrc.RemovePoints() end)