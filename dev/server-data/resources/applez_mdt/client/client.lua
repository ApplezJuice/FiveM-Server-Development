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

      TriggerEvent("pNotify:SendNotification", {
            text = "<b style='color:white'>MDT Open",
            type = "success",
            queue = "success",
            timeout = 2000,
            layout = "bottomRight",
        })
      mdtOpen = true
    elseif mdtOpen then
      -- close mdt
      SetNuiFocus(false, false)
      SendNUIMessage({type = 'close'})

      TriggerEvent("pNotify:SendNotification", {
            text = "<b style='color:white'>MDT Closed",
            type = "success",
            queue = "success",
            timeout = 2000,
            layout = "bottomRight",
        })
      mdtOpen = false
    end
  end
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
