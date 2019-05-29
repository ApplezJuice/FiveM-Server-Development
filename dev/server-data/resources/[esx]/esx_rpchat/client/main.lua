--[[

  ESX RP Chat

--]]

--[[RegisterNetEvent('sendMessage911')
AddEventHandler('sendMessage911', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  TriggerServerEvent("chekjob", name, message)
  if pid == myId then
    TriggerEvent('chatMessage', "", {0, 150, 200}, " YOUR MESSAGE: [911] || Description: " .. message)
  end
end)

RegisterNetEvent('sendMessage911ToCops')
AddEventHandler('sendMessage911ToCops', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {0, 50, 200}, " [911] || Description: " .. message)
  end
end)]]--
displayTime = 60 -- in seconds
blip = nil
blips = {}

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(callid, x, y, z)
  blip = AddBlipForCoord(x, y, z)
  SetBlipSprite(blip, 488)
  SetBlipScale(blip, 1.0)
  SetBlipColour(blip, 3)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('911 Call - ' .. callid)
  EndTextCommandSetBlipName(blip)
  table.insert(blips, blip)
  Wait(displayTime * 1000)
  for i, blip in pairs(blips) do
      RemoveBlip(blip)
  end
end)

RegisterNetEvent('Fax:clientCoords')
AddEventHandler('Fax:clientCoords', function(service, desc, callid)
  local ped = GetPlayerPed(PlayerId())
  local x, y, z = table.unpack(GetEntityCoords(ped, true))
  TriggerServerEvent('Fax:gotCoords', service, desc, callid, x, y, z)
end)

---------------------------------------------------------------------------------
RegisterNetEvent('Fax:SendCall')
AddEventHandler('Fax:SendCall', function(service, desc, callid, x, y, z)
    --local ped = GetPlayerPed(PlayerId())

	if service == "pd" or service == "ems" then
    TriggerServerEvent("Fax:SendCallToTeam", service, desc, callid, x, y, z)
    end

end)




RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 " .. name .." ".."^6 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 " .. name .." ".."^6 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^0* " .. name .."  ".."^0  " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^0* " .. name .."  ".."^0  " .. message)
  end
end)

--[[
AddEventHandler('esx-qalle-chat:me', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)

    if pid == myId then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(86, 125, 188, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i> {0}:<br> {1}</div>',
            args = { name, message }
        })
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 15.4 then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(86, 125, 188, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i> {0}:<br> {1}</div>',
            args = { name, message }
        })
    end
end)--]]


RegisterNetEvent('client:checkEngine')
AddEventHandler('client:checkEngine', function(msg)
	local pos = GetEntityCoords(GetPlayerPed(-1),true)
	local veh = GetClosestVehicle(pos.x,pos.y,pos.z,100.00,0)
	local healthEngineCurrent = GetVehicleEngineHealth(veh)
  	local oilLevelCurrent = GetVehicleOilLevel(veh) 
	TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> System:<br> Engine Status: {0} - Oil Level: {1}</div>',
			args = { healthEngineCurrent, oilLevelCurrent }
	})
end)
