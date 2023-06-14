local QBCore = exports['qb-core']:GetCoreObject()
local FNC = {}

RegisterCommand('pedmenu', function()
	TriggerEvent('jerzys_pedmenu:client:init')
end)


RegisterNetEvent('jerzys_pedmenu:client:init', function ()
	local PlayerData = QBCore.Functions.GetPlayerData()
	if not Config.CheckPerms(PlayerData.citizenid) then return end
	FNC.OPENPEDMENU(PlayerData.citizenid)
end)


FNC.OPENPEDMENU = function(cid)
	local PlayerData = QBCore.Functions.GetPlayerData()
	if PlayerData.citizenid ~= cid then return end
	if not Config.CheckPerms(cid) then return end
	lib.notify({title = 'JERZYS-PED-MENU', description = 'Welcome to the Ped, use your Peds properly'})
	local menu = {
		id = cid..'-pedMenu',
		title = 'PED MENU',
		onSelected = function (selected, secondary, args)
			if args.ped == 'reloadskin' then ExecuteCommand('reloadskin') lib.notify({title = 'JERZYS-PED-MENU', description = 'LITTE COOLDOWN 5 SECONDS'})return end
			FNC.SETMODEL(args.ped)
		end,
		options = {
			{label = 'RESET PED', args = { ped = 'reloadskin' }}
		}
	}
	for k,v in ipairs(Config.Auth[cid].ped) do
		menu.options[#menu.options+1] = { 
			label = v.name, args = { ped = v.ped }, close = true
		}
	end

	lib.registerMenu(menu)
	lib.showMenu(menu.id)
end

FNC.SETMODEL = function(Model)
	lib.notify({title = 'JERZYS-PED-MENU', description = 'WAIT YOUR PED MENU IS LOADING'})
	Wait(1000)
	Model = GetHashKey(Model)
	if IsModelValid(Model) then
	if not HasModelLoaded(Model) then
		RequestModel(Model)
		while not HasModelLoaded(Model) do
			Citizen.Wait(1000)
		end
	end
		
	SetPlayerModel(PlayerId(), Model)
	SetPedDefaultComponentVariation(PlayerPedId())
		
	SetModelAsNoLongerNeeded(Model)
	end
end