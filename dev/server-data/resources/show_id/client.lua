local disPlayerNames = 5
local listOn = false

playerDistances = {}

--[[
if IsControlPressed(0, 27)-- INPUT_PHONE  then
    if not listOn then
        local players = {}
        ptable = GetPlayers()
        for _, i in ipairs(ptable) do
            local wantedLevel = GetPlayerWantedLevel(i)
            r, g, b = GetPlayerRgbColour(i)
            table.insert(players,
            '<tr style=\"color: rgb(' .. r .. ', ' .. g .. ', ' .. b .. ')\"><td>' .. GetPlayerServerId(i) .. '</td><td>' .. sanitize(GetPlayerName(i)) .. '</td><td>' .. (wantedLevel and wantedLevel or tostring(0)) .. '</td></tr>'
            )
        end

        SendNUIMessage({ text = table.concat(players) })

        listOn = true
        while listOn do
            Wait(0)
            if(IsControlPressed(0, 27) == false) then
                listOn = false
                SendNUIMessage({
                    meta = 'close'
                })
                break
            end
        end
    end
end
]]

Citizen.CreateThread(function()
  while true do
    if IsControlPressed(1, 212)-- INPUT_PHONE  then
        if not listOn then
            -- code herre
            for id = 0, 32 do
        			if NetworkIsPlayerActive(id) then
        				--if GetPlayerPed(id) ~= GetPlayerPed(-1) then
        					if (playerDistances[id] < disPlayerNames) then
        						x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
        						if NetworkIsPlayerTalking(id) then
        							DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 247,124,24)
        						else
        							DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 255,255,255)
        						end
        					end
        				--end
        			end
            end
            for id = 0, 32 do
                if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                    x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                    distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
    				playerDistances[id] = distance
                end
            end


            listOn = true
            while listOn do
                Wait(0)
                if(IsControlPressed(1, 212) == false) then
                    listOn = false
                    break
                end
            end
        end
    end

    Citizen.Wait(0)
  end
end)



function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
