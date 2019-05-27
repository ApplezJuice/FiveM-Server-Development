-- more emotes available at https://pastebin.com/6mrYTdQv
local emotes = {
	['smoke'] = "WORLD_HUMAN_SMOKING",
	['cop'] = "WORLD_HUMAN_COP_IDLES",
	['lean'] = "WORLD_HUMAN_LEANING",
	['sit'] = "WORLD_HUMAN_PICNIC",
	['stupor'] = "WORLD_HUMAN_STUPOR",
	['sunbathe2'] = "WORLD_HUMAN_SUNBATHE_BACK",
	['sunbathe'] = "WORLD_HUMAN_SUNBATHE",
	['medic'] = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
	['clipboard'] = "WORLD_HUMAN_CLIPBOARD",
	['party'] = "WORLD_HUMAN_PARTYING",
	['kneel'] = "CODE_HUMAN_MEDIC_KNEEL",
	['notepad'] = "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
	['weed'] = "WORLD_HUMAN_SMOKING_POT",
	['impatient'] = "WORLD_HUMAN_STAND_IMPATIENT",
	['fish'] = "WORLD_HUMAN_STAND_FISHING",
	['weld'] = "WORLD_HUMAN_WELDING",
	['photography'] = "WORLD_HUMAN_PAPARAZZI",
	['film'] = "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
	['cheer'] = "WORLD_HUMAN_CHEERING",
	['binoculars'] = "WORLD_HUMAN_BINOCULARS",
	['flex'] = "WORLD_HUMAN_MUSCLE_FLEX",
	['weights'] = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS",
	['yoga'] = "WORLD_HUMAN_YOGA",
	['point'] = "mp_point"
}
-- this is an area for customizing messages
local msgTemplates = {
	['prefix'] = '<b><span style="color:rgb(255,0,0)">EMOTES</span>:</b> ',
	['displayEmotes'] = '<br>{0}',
	['playingEmote'] = 'Playing the emote ^3{0}^0',
	['errorPrefix'] = '<b><span style="color:rgb(255,0,0)">ERROR</span>:</b> ',
	['errorInVehicle'] = 'You must leave the vehicle first',
	['errorInvalidName'] = 'Invalid emote name',
	['errorDisplayEmotes'] = '^7Use \"^3/emotes^7\" to display all of the emotes',
}

--[[------------------------------------------------------------------------------------------------

					DON'T TOUCH BELOW THIS UNLESS YOU KNOW WHAT YOU ARE DOING

------------------------------------------------------------------------------------------------]]--

function message(templates, args)
	local total = ''
	for _, n in ipairs(templates) do
		total = total..msgTemplates[n]
	end
	TriggerEvent('chat:addMessage', {
		template = total,
		args = args or {}
	})
end

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1)) -- Registering whether or not the player is in an active scenario

function playEmote(emoteName) -- Plays an emote from the given name dictionary
	if not DoesEntityExist(GetPlayerPed(-1)) then -- Return of the ped doesn't exist
		return false
	end

	if IsPedInAnyVehicle(GetPlayerPed(-1)) then -- Returns if the player is in any vehicle
		message({'errorPrefix', 'errorInVehicle'})
		return false
	end

	if IsPedArmed(GetPlayerPed(-1), 7) then -- If the player is holding weapon, remove it
		SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
	end

	TaskStartScenarioInPlace(GetPlayerPed(-1), emoteName, 0, true) -- Start the scenario
	emotePlaying = true
	return true
end

Citizen.CreateThread(function()
	while true do

		if emotePlaying then
			if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
				-- Cancels the emote if the player is moving
				ClearPedTasks(GetPlayerPed(-1))
				emotePlaying = false
			end
		end

		Citizen.Wait(0)
	end
end)

RegisterCommand('emote', function(source, args, raw)
	if #args > 0 then -- if supplied atleast 1 argument
		local name = args[1]
		if emotes[name] ~= nil then -- Checking if the name is in the dictionary
			if playEmote(emotes[name]) then -- Playing the emote from the dictionary
				message({'prefix', 'playingEmote'}, {name})
			end
		else
			message({'errorPrefix', 'errorInvalidName'}) -- Saying if the name wasn't in the dictionary
		end
	else
		message({'errorPrefix', 'errorDisplayEmotes'}) -- showing a message to display emotes
	end
end)
TriggerEvent('chat:addSuggestion', '/emote', 'Plays an emote', {
	{name = 'name', help = 'The emote name to play'}
})
RegisterCommand('emotes', function(source, args, raw)
	local index = 0 -- Current index
	local display = "^7" -- Text to display

	for name, value in pairs(emotes) do -- Adding the emote names to the display var
		index = index + 1
		if index == 1 then
			display = display..name
		else
			display = display..", "..name
		end
	end

	message({'prefix', 'displayEmotes'}, {display})
end)
TriggerEvent('chat:addSuggestion', '/emotes', 'Displays possible emotes')
RegisterCommand('cancelemote', function(source, args, raw)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	emotePlaying = false
end)
TriggerEvent('chat:addSuggestion', '/cancelemote', 'Immediately cancels your current emote')


--point with b
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)

Citizen.CreateThread(function()
	local handsup = false
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("random@mugging3")
		if IsControlJustPressed(1, 323) then
			if DoesEntityExist(lPed) and not IsPedSittingInAnyVehicle(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("random@mugging3")
					while not HasAnimDictLoaded("random@mugging3") do
						Citizen.Wait(100)
					end

					if not handsup then
						handsup = true
						TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
					else
						handsup = false
						ClearPedSecondaryTask(lPed)
					end   
				end)
			end
		end

	end
end)
