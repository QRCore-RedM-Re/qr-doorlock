fx_version "cerulean"
games { "rdr3" }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

description 'Doorlock Handler for RedM QR-Core'
author 'QR'

shared_scripts { '@ox_lib/init.lua', 'modules/shared.lua', 'shared/*.lua' }
client_scripts { 'modules/client.lua', 'client/*.lua' }
server_scripts { 'modules/server.lua', 'server/*.lua' }

lua54 'yes'