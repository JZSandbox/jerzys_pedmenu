local QBCore = exports['qb-core']:GetCoreObject()
Debug = {}

Debug.msg = function(message)
    print('[JERZYS-PED-MENU] '.. message)
end

Config = {}
Config.Command = 'pedmenu'

Config.CheckPerms = function(cId)
    Debug.msg('CHECK AUTH FOR')
    local PlayerData = QBCore.Functions.GetPlayerData()
    Debug.msg(json.encode(PlayerData.citizenid, {indent = true}))
    local authorized = false
    if Config.Auth[cId] then
        Debug.msg('AUTH SUCCESSFULL')
        authorized = true
    else
        Debug.msg('NO PERMISSION FOR PED MENU')
    end

    return authorized
end

Config.Auth = {
    ["citizenid"] = {
        ped = {
            {
                name = 'NAME',
                ped = 'HASH'
            },
        },
    },
}