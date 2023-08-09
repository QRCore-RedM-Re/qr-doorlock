local qrs = require('modules.server')

-- Get Door States --
lib.callback.register('qr-doorlock:server:SyncDoors', function(source) return Doors.List end)

-- Update Door State on Server --
lib.callback.register('qr-doorlock:server:UpdateState', function(source, ID, STATE) return qrs.UpdateState(ID, STATE) end)