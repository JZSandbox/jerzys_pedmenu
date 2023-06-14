fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'jerzys'
description 'PED'

shared_scripts { '@ox_lib/init.lua', 'config.lua' }

client_scripts { 'client/*.lua' }

server_scripts { 'server/*.lua' }

dependencies { 'ox_lib' }