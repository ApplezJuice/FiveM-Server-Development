--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local _source = source

	local xPlayer = ESX.GetPlayerFromId(_source)
	if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
		TriggerClientEvent("pNotify:SendNotification", _source,{
			text = "<b style='color:red'>Invalid Amount!",
			type = "error",
			queue = "error",
			timeout = 5000,
			layout = "bottomRight",
		})
	else
		xPlayer.removeMoney(amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
	end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local base = 0
	amount = tonumber(amount)
	base = xPlayer.getAccount('bank').money
	if amount == nil or amount <= 0 or amount > base then

		TriggerClientEvent("pNotify:SendNotification", _source,{
			text = "<b style='color:red'>Invalid Amount!",
			type = "error",
			queue = "error",
			timeout = 5000,
			layout = "bottomRight",
		})

	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addMoney(amount)
	end
end)
--
RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	balance = xPlayer.getAccount('bank').money
	TriggerClientEvent('currentbalance1', _source, balance)

end)


RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local zPlayer = ESX.GetPlayerFromId(tonumber(to))
	--local yPlayers = ESX.GetPlayers()
	--local zPlayer = ESX.GetPlayerFromId(yPlayers[to])
	--local zPlayer = ESX.GetPlayerFromId()
--	local zPlayer = nil
	--for i=1, #yPlayers, 1 do
	--	local curXplayer = ESX.GetPlayerFromId(yPlayers[i])
	--	if curXplayer.identifier == tonumber(to) then
	--		zPlayer = ESX.GetPlayerFromId(yPlayers[i])
	--		break
	--	end
	--end

	--local zPlayer = yPlayers[to]
	local balance = 0
	local zbalance = 0
	balance = xPlayer.getAccount('bank').money
	zbalance = zPlayer.getAccount('bank').money
	--print(tostring(amountt))

	amountt = tonumber(amountt)

	if tonumber(_source) == tonumber(to) then
		TriggerClientEvent("pNotify:SendNotification", _source,{
			text = "<b style='color:red'>You cannot transfer to your self!",
			type = "error",
			queue = "error",
			timeout = 5000,
			layout = "bottomRight",
		})
		--TriggerClientEvent('chatMessage', _source, "You cannot transfer to your self")
	else
		if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
			TriggerClientEvent("pNotify:SendNotification", _source,{
    		text = "<b style='color:red'>You don't have enough money in the bank!",
    		type = "error",
    		queue = "error",
    		timeout = 5000,
    		layout = "bottomRight",
    	})
			--TriggerClientEvent('chatMessage', _source, "You don't have enough money in the bank.")
		else
			xPlayer.removeAccountMoney('bank', amountt)
			TriggerClientEvent("pNotify:SendNotification", _source,{
    		text = "<b style='color:white'>You sent </b><b style='color:green'>$".. amountt .."</b><b style='color:white'> to ".. GetPlayerName(tonumber(to)) .."</b><b style='color:white'>!",
    		type = "success",
    		queue = "success",
    		timeout = 5000,
    		layout = "bottomRight",
    	})
			zPlayer.addAccountMoney('bank', amountt)
			TriggerClientEvent("pNotify:SendNotification", tonumber(to),{
				text = "<b style='color:white'>You received </b><b style='color:green'>$".. amountt .."</b><b style='color:white'> from ".. GetPlayerName(source) .."</b><b style='color:white'>!",
    		type = "error",
    		queue = "error",
    		timeout = 5000,
    		layout = "bottomRight",
    	})
		end

	end
end)
