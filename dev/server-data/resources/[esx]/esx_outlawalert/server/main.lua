ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	--TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('carjack', playerGender, vehicleLabel, streetName))
	TriggerClientEvent('esx_outlawalert:applez:outlawNotify', -1, 'carjack', playerGender, vehicleLabel, streetName)
	TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	--TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('combat', playerGender, streetName))
	TriggerClientEvent('esx_outlawalert:applez:outlawNotify', -1, 'combat', playerGender,'na', streetName)
	TriggerClientEvent('esx_outlawalert:combatInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	--TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('gunshot', playerGender, streetName))
	TriggerClientEvent('esx_outlawalert:applez:outlawNotify', -1, 'gunshot', playerGender,'na', streetName)
	TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
end)


RegisterServerEvent('esx_outlawalert:speedingInProgress')
AddEventHandler('esx_outlawalert:speedingInProgress', function(targetCoords)

	--TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('gunshot', playerGender, streetName))
	--TriggerEvent('esx_outlawalert:applez:outlawNotify', -1, 'speeding', playerGender,'na', streetName)
	TriggerClientEvent('esx_outlawalert:speedingInProgress', -1, targetCoords)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('applez:sendCarSpeeding')
AddEventHandler('applez:sendCarSpeeding', function(type, gender, car, street)
	if gender == 0 then
		playerGender2 = 'male'
	else
		playerGender2 = 'female'
	end
	TriggerClientEvent('esx_outlawalert:applez:outlawNotify', -1, 'speeding', playerGender2, car, street)
end)

RegisterServerEvent('applez:sendNotification')
AddEventHandler('applez:sendNotification', function(type, gender, car, street)
	if type == 'gunshot' then
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-bell"></i> [DISPATCH] 10-71 - GUNSHOTS <br> A '.. gender ..' has been spotted firing a weapon at '.. street ..'</div>'
		})
	elseif type == 'combat' then
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-bell"></i> [DISPATCH] 10-10 - FIGHT <br> A '.. gender ..' has been spotted fighting at '.. street ..'</div>'
		})
	elseif type == 'carjack' then
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-bell"></i> [DISPATCH] 10-75 - STOLEN <br> A '.. gender ..' has been spotted stealing a '.. car ..' at '.. street ..'</div>'
		})
	elseif type == 'speeding' then
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(158, 23, 23, 0.6); border-radius: 3px;"> <i class="fas fa-bell"></i> [DISPATCH] 10-94 - RECKLESS DRIVING <br> A '.. gender ..' has been spotted driving recklessly in a '.. car ..' at '.. street ..'</div>'
		})
	end
end)
