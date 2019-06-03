TriggerEvent("es:addCommand", 'mdt', function(source, args, user)
	TriggerClientEvent('applez:mdt', source)
end, {help = "/mdt -- Opens the police MDT"})
