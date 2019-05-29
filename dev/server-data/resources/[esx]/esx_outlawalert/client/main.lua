ESX = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)


-- find closest ped enum
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end


function GetClosestPed()
    local closestPed = 0

    for ped in EnumeratePeds() do
        local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped), true)

        if distanceCheck <= 10.0 and distanceCheck ~= 0.0 then
            closestPed = ped
            break
        end
    end

    return closestPed
end
--end nearest ped


Citizen.CreateThread(function()
	local speedLimit = 120.0

	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player,false)
		local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
		if vehicle ~= 0 and not isPlayerWhitelisted then
			--if (IsPedInAnyVehicle(player, false)) then
		 local currentSpeed = GetEntitySpeed(vehicle) * 2.23
		 while currentSpeed > speedLimit do
		 		--TriggerServerEvent('applez:sendNotification', 'speeding', playerGender, vehicle, streetName)
			pedIsSpeeding()
			 TriggerServerEvent('applez:sendCarSpeeding', 'speeding', playerGender, vehicleLabel, streetName)
			 Citizen.Wait(10000)
			 currentSpeed = GetEntitySpeed(vehicle) * 2.23
		 end
		end
	end
end)

function pedIsSpeeding()
	local playerPed = GetPlayerPed(-1)
	local playerCoords = GetEntityCoords(playerPed)

	DecorSetInt(playerPed, 'isOutlaw', 2)

	TriggerServerEvent('esx_outlawalert:speedingInProgress', {
		x = ESX.Math.Round(playerCoords.x, 1),
		y = ESX.Math.Round(playerCoords.y, 1),
		z = ESX.Math.Round(playerCoords.z, 1)
	})
end

RegisterNetEvent('esx_outlawalert:applez:outlawNotify')
AddEventHandler('esx_outlawalert:applez:outlawNotify', function(type, gender, car, street)
	if isPlayerWhitelisted then

		if GetClosestPed() then
			TriggerServerEvent('applez:sendNotification', type, gender, car, street)
			--[[if type == 'gunshot' then
				TriggerEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-globe"></i> 911 GUNSHOT <br> A '.. gender ..' has been spotted firing a weapon at '.. street ..'</div>'
				})
			elseif type == 'combat' then
				TriggerEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-globe"></i> 911 FIGHT <br> A '.. gender ..' has been spotted fighting at '.. street ..'</div>'
				})
			elseif type == 'carjack' then
				TriggerEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-globe"></i> 911 CARJACK <br> A '.. gender ..' has been spotted stealing a '.. car ..' at '.. street ..'</div>'
				})
			elseif type == 'speeding' then
				TriggerEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-globe"></i> 911 RECKLESS DRIVING <br> A '.. gender ..' has been spotted driving recklessly in a '.. car ..' at '.. street ..'</div>'
				})

		--end]]--
		end
	end
end)

RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(alert)
	if isPlayerWhitelisted then
		ESX.ShowNotification(alert)
		--[[TriggerEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-globe"></i> 911 ALERT - '.. alert ..'</div>'
		})]]--
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if NetworkIsSessionStarted() then
			DecorRegister('isOutlaw', 3)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

			return
		end
	end
end)

-- Gets the player's current street.
-- Aaalso get the current player gender
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

AddEventHandler('skinchanger:loadSkin', function(character)
	playerGender = character.sex
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedCops) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

RegisterNetEvent('esx_outlawalert:speedingInProgress')
AddEventHandler('esx_outlawalert:speedingInProgress', function(targetCoords)
	if isPlayerWhitelisted then

			local alpha = 250
			local thiefBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipJackingRadius)

			SetBlipHighDetail(thiefBlip, true)
			SetBlipColour(thiefBlip, 1)
			SetBlipAlpha(thiefBlip, alpha)
			SetBlipAsShortRange(thiefBlip, true)

			while alpha ~= 0 do
				Citizen.Wait(Config.BlipJackingTime * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)

				if alpha == 0 then
					RemoveBlip(thiefBlip)
					return
				end
			end


	end
end)

RegisterNetEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		if Config.CarJackingAlert then
			local alpha = 250
			local thiefBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipJackingRadius)

			SetBlipHighDetail(thiefBlip, true)
			SetBlipColour(thiefBlip, 1)
			SetBlipAlpha(thiefBlip, alpha)
			SetBlipAsShortRange(thiefBlip, true)

			while alpha ~= 0 do
				Citizen.Wait(Config.BlipJackingTime * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)

				if alpha == 0 then
					RemoveBlip(thiefBlip)
					return
				end
			end

		end
	end
end)

RegisterNetEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then
		local alpha = 250
		local meleeBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipMeleeRadius)

		SetBlipHighDetail(meleeBlip, true)
		SetBlipColour(meleeBlip, 17)
		SetBlipAlpha(meleeBlip, alpha)
		SetBlipAsShortRange(meleeBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipMeleeTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(meleeBlip, alpha)

			if alpha == 0 then
				RemoveBlip(meleeBlip)
				return
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		-- is jackin'
		if (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) and Config.CarJackingAlert then

			Citizen.Wait(3000)
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted) then
				local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

				ESX.TriggerServerCallback('esx_outlawalert:isVehicleOwner', function(owner)
					if not owner then

						local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
						vehicleLabel = GetLabelText(vehicleLabel)

						DecorSetInt(playerPed, 'isOutlaw', 2)

						TriggerServerEvent('esx_outlawalert:carJackInProgress', {
							x = ESX.Math.Round(playerCoords.x, 1),
							y = ESX.Math.Round(playerCoords.y, 1),
							z = ESX.Math.Round(playerCoords.z, 1)
						}, streetName, vehicleLabel, playerGender)
					end
				end, plate)
			end

		elseif IsPedInMeleeCombat(playerPed) and Config.MeleeAlert then

			Citizen.Wait(10000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)

				TriggerServerEvent('esx_outlawalert:combatInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, playerGender)
			end

		elseif IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert then

			Citizen.Wait(3000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)

				TriggerServerEvent('esx_outlawalert:gunshotInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, playerGender)
			end

		end
	end
end)
