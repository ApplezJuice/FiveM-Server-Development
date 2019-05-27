els_Vehicles = {}

k = nil
vehName = nil
lightingStage = 0
fps = 0
prevframes = 0
curframes = 0
prevtime = 0
curtime = 0
advisorPatternSelectedIndex = 1
advisorPatternIndex = 1

lightPatternPrim = 0
lightPatternsPrim = 1
lightPatternSec = 1

elsVehs = {}

m_siren_state = {}
m_soundID_veh = {}
dualEnable = {}
d_siren_state = {}
d_soundID_veh = {}
h_horn_state = {}
h_soundID_veh = {}

curCleanupTime = 0

Citizen.CreateThread(function()

    TriggerServerEvent("els:requestVehiclesUpdate")

    while true do

        if isVehicleELS and canControlELS then

            if GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId())) == 18 then
                DisableControlAction(0, shared.horn, true)
            end
            
            DisableControlAction(0, 84, true) -- INPUT_VEH_PREV_RADIO_TRACK  
            DisableControlAction(0, 83, true) -- INPUT_VEH_NEXT_RADIO_TRACK 
            DisableControlAction(0, 81, true) -- INPUT_VEH_NEXT_RADIO
            DisableControlAction(0, 82, true) -- INPUT_VEH_PREV_RADIO
            DisableControlAction(0, 85, true) -- INPUT_VEH_PREV_RADIO

            SetVehRadioStation(GetVehiclePedIsUsing(PlayerPedId()), "OFF")
            SetVehicleRadioEnabled(GetVehiclePedIsUsing(PlayerPedId()), false)

            if(GetLastInputMethod(0)) then
                DisableControlAction(0, keyboard.stageChange, true)

                DisableControlAction(0, keyboard.pattern.primary, true)
                DisableControlAction(0, keyboard.pattern.secondary, true)
                DisableControlAction(0, keyboard.pattern.advisor, true)
                DisableControlAction(0, keyboard.modifyKey, true)

                DisableControlAction(0, keyboard.siren.tone_one, true)
                DisableControlAction(0, keyboard.siren.tone_two, true)
                DisableControlAction(0, keyboard.siren.tone_three, true)

                if IsDisabledControlPressed(0, keyboard.modifyKey) then

                    if IsDisabledControlJustReleased(0, keyboard.guiKey) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        if panelEnabled then
                            panelEnabled = false
                        else
                            panelEnabled = true
                        end
                    end

                    if IsDisabledControlJustReleased(0, keyboard.stageChange) then
                        if getVehicleVCFInfo(GetVehiclePedIsUsing(PlayerPedId())).interface.activationType == "invert" or getVehicleVCFInfo(GetVehiclePedIsUsing(PlayerPedId())).interface.activationType == "euro" then
                            upOneStage()
                        else
                            downOneStage()
                        end
                    end
                    if IsDisabledControlJustReleased(0, keyboard.takedown) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        TriggerServerEvent("els:setSceneLightState_s")
                    end
                else
                    if IsDisabledControlJustReleased(0, keyboard.stageChange) then
                        if getVehicleVCFInfo(GetVehiclePedIsUsing(PlayerPedId())).interface.activationType == "invert" or getVehicleVCFInfo(GetVehiclePedIsUsing(PlayerPedId())).interface.activationType == "euro" then
                            downOneStage()
                        else
                            upOneStage()
                        end
                    end
                    if IsDisabledControlJustReleased(0, keyboard.takedown) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        TriggerServerEvent("els:setTakedownState_s")
                    end
                    if IsDisabledControlJustReleased(0, 84) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        TriggerServerEvent("els:setCruiseLights_s")
                    end
                    if IsDisabledControlJustReleased(0, keyboard.warning) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())] ~= nil then
                            if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].warning then
                                TriggerServerEvent("els:changePartState_s", "warning", false)
                            else
                                TriggerServerEvent("els:changePartState_s", "warning", true)
                            end
                        else
                            TriggerServerEvent("els:changePartState_s", "warning", true)
                        end
                    end
                    if IsDisabledControlJustReleased(0, keyboard.secondary) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())] ~= nil then
                            if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].secondary then
                                TriggerServerEvent("els:changePartState_s", "secondary", false)
                            else
                                TriggerServerEvent("els:changePartState_s", "secondary", true)
                            end
                        else
                            TriggerServerEvent("els:changePartState_s", "secondary", true)
                        end
                    end
                    if IsDisabledControlJustPressed(0, keyboard.primary) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())] ~= nil then
                            if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].primary then
                                TriggerServerEvent("els:changePartState_s", "primary", false)
                            else
                                TriggerServerEvent("els:changePartState_s", "primary", true)
                            end
                        else
                            TriggerServerEvent("els:changePartState_s", "primary", true)
                        end
                    end
                end


                if GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId())) == 18 then
                    if (elsVehs[GetVehiclePedIsUsing(PlayerPedId())] ~= nil) then
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].stage == 3 then
                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_one) then
                                setSirenStateButton(1)
                            end
                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_two) then
                                setSirenStateButton(2)
                            end
                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_three) then
                                setSirenStateButton(3)
                            end
                        end
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].stage == 2 then
                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_one) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, keyboard.siren.tone_one) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 1)
                            end

                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_two) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, keyboard.siren.tone_two) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 2)
                            end

                            if IsDisabledControlJustReleased(0, keyboard.siren.tone_three) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, keyboard.siren.tone_three) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 3)
                            end
                        end
                    end
                end

            else
                DisableControlAction(0, controller.modifyKey, true)
                DisableControlAction(0, controller.stageChange, true)
                DisableControlAction(0, controller.siren.tone_one, true)
                DisableControlAction(0, controller.siren.tone_two, true)
                DisableControlAction(0, controller.siren.tone_three, true)

                if els_Vehicles[checkCarHash(GetVehiclePedIsUsing(PlayerPedId()))].activateUp then
                    if IsDisabledControlPressed(0, controller.modifyKey) and IsDisabledControlJustReleased(0, controller.stageChange) then
                        downOneStage()
                    elseif IsDisabledControlJustReleased(0, controller.stageChange) then
                        upOneStage()
                    end
                else
                    if IsDisabledControlJustReleased(0, controller.stageChange) then
                        downOneStage()
                    elseif IsDisabledControlPressed(0, controller.modifyKey) and IsDisabledControlJustReleased(0, controller.stageChange) then
                        upOneStage()
                    end
                end

                if IsDisabledControlPressed(0, controller.modifyKey) then
                    DisableControlAction(0, controller.takedown, true)
                    if IsDisabledControlPressed(0, controller.modifyKey) and IsDisabledControlJustReleased(0, controller.takedown) then
                        if playButtonPressSounds then
                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        end
                        TriggerServerEvent("els:setTakedownState_s")
                    end
                end

                if GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId())) == 18 then
                    if (elsVehs[GetVehiclePedIsUsing(PlayerPedId())] ~= nil) then
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].stage == 3 then
                            if not IsDisabledControlPressed(0, controller.modifyKey) then
                                if IsDisabledControlJustReleased(0, controller.siren.tone_one) then
                                    setSirenStateButton(1)
                                end
                                if IsDisabledControlJustReleased(0, controller.siren.tone_two) then
                                    setSirenStateButton(2)
                                end
                                if IsDisabledControlJustReleased(0, controller.siren.tone_three) then
                                    setSirenStateButton(3)
                                end
                            end

                        end
                        if elsVehs[GetVehiclePedIsUsing(PlayerPedId())].stage == 2 then
                            if IsDisabledControlJustReleased(0, controller.siren.tone_one) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, controller.siren.tone_one) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 1)
                            end

                            if IsDisabledControlJustReleased(0, controller.siren.tone_two) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, controller.siren.tone_two) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 2)
                            end

                            if IsDisabledControlJustReleased(0, controller.siren.tone_three) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 0)
                            end
                            if IsDisabledControlJustPressed(0, controller.siren.tone_three) then
                                if playButtonPressSounds then
                                    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                end
                                TriggerServerEvent("els:setSirenState_s", 3)
                            end
                        end
                    end
                end
            end

            if GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId())) == 18 then
                if not IsDisabledControlPressed(0, controller.modifyKey) then
                    if (IsDisabledControlJustPressed(0, shared.horn)) then
                        TriggerServerEvent("els:setHornState_s", 1)
                    end

                    if (IsDisabledControlJustReleased(0, shared.horn)) then
                        TriggerServerEvent("els:setHornState_s", 0)
                    end
                end
            end
        end

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isVehicleELS and canControlELS then
            if IsDisabledControlPressed(0, keyboard.modifyKey) then
                if IsDisabledControlPressed(0, keyboard.pattern.primary) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changePrimaryPatternMath(-1)
                end
                if IsDisabledControlPressed(0, keyboard.pattern.secondary) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changeSecondaryPatternMath(-1)
                end
                if IsDisabledControlPressed(0, keyboard.pattern.advisor) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changeAdvisorPatternMath(-1)
                end
            else
                if IsDisabledControlPressed(0, keyboard.pattern.primary) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changePrimaryPatternMath(1)
                end
                if IsDisabledControlPressed(0, keyboard.pattern.secondary) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changeSecondaryPatternMath(1)
                end
                if IsDisabledControlPressed(0, keyboard.pattern.advisor) then
                    if playButtonPressSounds then
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    changeAdvisorPatternMath(1)
                end
            end
        end
        Wait(0)
    end
end)


-- Citizen.CreateThread(function()

--     while true do
--         LghtSoundCleaner()

--         Wait(800)
--     end
-- end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(elsVehs) do
            if(v ~= nil or DoesEntityExist(k)) then
                if (GetDistanceBetweenCoords(GetEntityCoords(k, true), GetEntityCoords(PlayerPedId(), true), true) <= vehicleSyncDistance) then
                    if elsVehs[k].warning or elsVehs[k].secondary or elsVehs[k].primary then
                        SetVehicleEngineOn(k, true, true, false)
                    end
                    
                    local vehN = checkCarHash(k)

                    for i=11,12 do
                        if (not IsEntityDead(k) and DoesEntityExist(k)) then
                            if(els_Vehicles[vehN].extras[i] ~= nil and els_Vehicles[vehN].extras[i].enabled) then
                                if(IsVehicleExtraTurnedOn(k, i)) then
                                    local boneIndex = GetEntityBoneIndexByName(k, "extra_" .. i)
                                    local coords = GetWorldPositionOfEntityBone(k, boneIndex)
                                    local rotX, rotY, rotZ = table.unpack(RotAnglesToVec(GetEntityRotation(k, 2)))

                                    if els_Vehicles[vehN].extras[i].env_light then
                                        if i == 11 then
                                            DrawSpotLightWithShadow(coords.x + els_Vehicles[vehN].extras[11].env_pos.x, coords.y + els_Vehicles[vehN].extras[11].env_pos.y, coords.z + els_Vehicles[vehN].extras[11].env_pos.z, rotX, rotY, rotZ, 255, 255, 255, 75.0, 2.0, 10.0, 20.0, 0.0, true)
                                        end
                                        if i == 12 then
                                            DrawLightWithRange(coords.x + els_Vehicles[vehN].extras[12].env_pos.x, coords.y + els_Vehicles[vehN].extras[12].env_pos.y, coords.z + els_Vehicles[vehN].extras[12].env_pos.z, 255, 255, 255, 50.0, envirementLightBrightness)
                                        end
                                    else
                                        if i == 11 then
                                            DrawSpotLightWithShadow(coords.x, coords.y, coords.z + 0.2, rotX, rotY, rotZ, 255, 255, 255, 75.0, 2.0, 10.0, 20.0, 0.0, true)
                                        end
                                        if i == 12 then
                                            DrawLightWithRange(coords.x, coords.y, coords.z, 255, 255, 255, 50.0, envirementLightBrightness)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(4)
    end
end)

Citizen.CreateThread(function()

    while true do
        for k,v in pairs(elsVehs) do
            if (v ~= nil and DoesEntityExist(k) and GetDistanceBetweenCoords(GetEntityCoords(k, true), GetEntityCoords(PlayerPedId(), true), true) <= vehicleSyncDistance) then
                SetVehicleAutoRepairDisabled(k, true)

                if getVehicleVCFInfo(k).priml.type == string.lower("chp") and getVehicleVCFInfo(k).wrnl.type == string.lower("chp") and getVehicleVCFInfo(k).secl.type == string.lower("chp") then

                	if v.stage == 0 then
                		for i=1,10 do
                			setExtraState(k, i, 1)
                		end
                	end

                	if v.stage == 1 and v.advisorPattern <= 1 then
                		runCHPPattern(k, v.advisorPattern, v.stage)
                	end

                	if v.stage == 2 and v.secPattern <= 3 then
                		runCHPPattern(k, v.secPattern, v.stage)
                	end

                	if v.stage == 3 and v.primPattern <= 3 then
                		runCHPPattern(k, v.primPattern, v.stage)
                	end

                else

	                if (v.warning) then
	                    if getVehicleVCFInfo(k).wrnl.type == string.lower("leds") and v.advisorPattern <= 53 then
	                        runLedPatternWarning(k, v.advisorPattern)
	                    end
	                else
	                    setExtraState(k, 5, 1)
	                    setExtraState(k, 6, 1)
	                end

	                if (v.secondary) then
	                    if getVehicleVCFInfo(k).secl.type == string.lower("leds") and v.secPattern <= 140 then
	                        runLedPatternSecondary(k, v.secPattern, function(cb) vehIsReadySecondary[k] = cb end)
	                    elseif getVehicleVCFInfo(k).secl.type == string.lower("traf") and v.secPattern <= 36 then
	                        runTrafPattern(k, v.secPattern)
	                    end
	                else
	                    setExtraState(k, 7, 1)
	                    setExtraState(k, 8, 1)
	                    setExtraState(k, 9, 1)
	                end

	                if (v.primary) then
	                    if getVehicleVCFInfo(k).priml.type == string.lower("leds") and v.primPattern <= 140 then
	                        runLedPatternPrimary(k, v.primPattern)
	                    end
	                else
	                    setExtraState(k, 1, 1)
	                    setExtraState(k, 2, 1)
	                    setExtraState(k, 3, 1)
	                    setExtraState(k, 4, 1)
	                end

	            end
            end
        end
        Citizen.Wait(0)
    end
end)
