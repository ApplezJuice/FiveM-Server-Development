TriggerEvent("es:addCommand", 'mdt', function(source, args, user)
	TriggerClientEvent('applez:mdt', source)
end, {help = "/mdt -- Opens the police MDT"})

function listAllPlayers()
	local result = MySQL.Sync.fetchAll("SELECT * FROM users")
	return result
end

function findCertainPerson(lastname)
	lastname = (lastname:gsub("^%l", string.upper))
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE lastname = @lastname", {['@lastname'] = lastname})
	if result[1] ~= nil then
		return result
	else
		return nil
	end
end


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			number = identity['phone_number']
		}
	else
		return nil
	end
end

RegisterServerEvent('applez:searchLastNameDatabase')
AddEventHandler('applez:searchLastNameDatabase', function(lastname)
	local s = source
	--print("got to server side last name db")
	local searchResult = findCertainPerson(lastname)
	TriggerClientEvent('applez:getLastNameResults', s, searchResult)
end)

RegisterServerEvent('applez:getidentity')
AddEventHandler('applez:getidentity', function()
	local s = source
  local selfName = getIdentity(s)

	local jones = findCertainPerson("Jones")
	local jonesFirstName = jones[1]['firstname']
	--TriggerClientEvent("chatMessage", s, "name: " .. jonesFirstName)

  user = selfName.lastname
	--TriggerClientEvent("chatMessage", s, "source: " .. s)
	--TriggerClientEvent("chatMessage", s, "name: " .. user)
	TriggerClientEvent('applez:setPlayerName', s, user)

end)
