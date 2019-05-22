fuel = 1.19 -- Fuel Cost, this could be made to randomise between 1.05 and 1.30 or something like that
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

--local wallet = xPlayer.accounts[1].money    
    local wallet = xPlayer.getMoney()
    local cost = fuel * amount

--    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "The price of fuel is $" .. fuel)
    local new_wallet = wallet - round(cost)

--    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "cost test: " .. round(cost))
 --   TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "wallet test: " .. wallet)
   -- TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "new wallet test: " .. new_wallet)
    xPlayer.removeMoney(round(cost))
local roundedCost = round(cost)

	TriggerClientEvent("pNotify:SendNotification", source,{
		text = "<b style='color:white'>Filling up today cost you </b><b style='color:red'>$" .. roundedCost,
		type = "error",
		queue = "error",
		timeout = 5000,
		layout = "bottomRight",
	})

    TriggerEvent("es:setPlayerData", source, "money", new_wallet, function(response, success)
        TriggerClientEvent('es:activateMoney', source, new_wallet)

        if(success)then
           -- TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You filled up with " .. round(amount) .. " litres of fuel")
           -- TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Filling up today cost you $" .. round(cost))
	    TriggerClientEvent("pNotify:SendNotification", source,{
	text = "<b style='color:white'>Filling up today cost you </b><b style='color:red'>$" .. round(cost),
	type = "error",
	queue = "error",
	timeout = 10000,
	layout = "bottomRight",
})
        end
    end)

end)

