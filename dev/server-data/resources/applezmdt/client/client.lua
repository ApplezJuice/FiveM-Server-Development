ESX = nil
local mdtOpen = false
local isPlayerPolice = false

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

  while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

  isPlayerPolice = isPlayerPoliceOfficer()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerPolice = isPlayerPoliceOfficer()
end)

--===============================================
--==         Last Name Search Event            ==
--===============================================

RegisterNUICallback('searchlastname', function(data)
	--TriggerEvent("chatMessage", "testing", {255, 0, 0}, " Got to server side searchLastNameDatabase")
	TriggerServerEvent('applez:searchLastNameDatabase', data.lastnameSearch)
end)

RegisterNetEvent('applez:getLastNameResults')
AddEventHandler('applez:getLastNameResults', function(lastnameresult)
	--TriggerEvent("chatMessage", "testing", {255, 0, 0}, " Got back to client side")

	--[[SendNUIMessage({
		type = "nameSearchResults",
		namesearchResult = "test"
	})]]--
	if lastnameresult ~= nil then
		SendNUIMessage({
			type = "nameSearchResults",
			namesearchResult = lastnameresult
			})
	end
end)

--===============================================
--==             Core Threading                ==
--===============================================
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if mdtOpen then
      if IsControlJustPressed(1, 322) then
		    mdtOpen = false
  			SetNuiFocus(false, false)
  			SendNUIMessage({type = 'close'})
  		end
    end

  end
end)
--
--===============================================
--==               NUI callbacks               ==
--===============================================

RegisterNetEvent('applez:setPlayerName')
AddEventHandler('applez:setPlayerName', function(playername, rank)
local policeRank = ESX.PlayerData.job.grade_name

	if policeRank == 'boss' then
		policeRank = 'Chief'
	end

	SendNUIMessage({
		type = "selfName",
		player = policeRank .. " " .. playername
		})
end)

--===============================================
--==             Open MDT Window               ==
--===============================================

RegisterNetEvent('applez:mdt')
AddEventHandler('applez:mdt', function()
  -- if police officer and in service
  if isPlayerPolice then
    if not mdtOpen then
      -- open mdt
      SetNuiFocus(true, true)
			SendNUIMessage({type = 'openMdt'})
      TriggerServerEvent('applez:getidentity')
      mdtOpen = true
    elseif mdtOpen then
      -- close mdt
      SetNuiFocus(false, false)
      SendNUIMessage({type = 'close'})
      mdtOpen = false
    end
  end
end)

RegisterNUICallback('NUIFocusOff', function()
	mdtOpen = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)

--===============================================
--==        Return true if police              ==
--===============================================
function isPlayerPoliceOfficer()

	if not ESX.PlayerData then
		return false
	elseif not ESX.PlayerData.job then
		return false
	elseif "police" == ESX.PlayerData.job.name then
		return true
	else
    return false
  end

end
