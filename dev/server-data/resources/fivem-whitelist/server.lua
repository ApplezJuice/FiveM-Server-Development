--[[
Add IPs in the whitelist

Example:
local whitelist = {
    "56.20.947.20",
    "94.314.267.25"
}
]]
local whitelist = {
    "23.241.5.146"
}

-- The code, don't touch anything here --
RegisterServerEvent("rlPlayerActivated")

AddEventHandler("rlPlayerActivated", function()
    playerIP = stringSplit(GetPlayerEP(source), ":")[1]
    
    for _, ip in pairs(whitelist) do
        if playerIP == ip then
            return
        end
    end
    
    DropPlayer(source, "You aren't whitelisted. Your IP is " .. playerIP .. ".")
end)

function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end
