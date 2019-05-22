RegisterCommand('twit', function(source, args)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:white'@" .. GetPlayerName(source)"</b>",
		type = "success",
		timeout = (1500),
		layout = "bottomright",
		queue = "global"
	})
end,false)
