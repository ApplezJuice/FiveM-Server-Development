_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Player IDs", "~b~Online Players")
_menuPool:Add(mainMenu)

function GetPlayers()
  local players = {}
  for i = 0, 31 do
    if NetworkIsPlayerActive(i) then
      table.insert(players, i)
    end
  end
  return players
end

function AddPlayers(menu)
    --local newitem = NativeUI.CreateCheckboxItem("Add ketchup?", ketchup, "Do you wish to add ketchup?")
    --menu:AddItem(newitem)
    local players = {}
    ptable = GetPlayers()
    for _, i in ipairs(ptable) do
      local playerString = GetPlayerServerId(i) .. ", " .. GetPlayerName(i)
      local newItem = NativeUI.CreateItem(playerString)
      menu:AddItem(newItem)
    end
end

AddPlayers(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        -- action 20 is INPUT_MULTIPLAYER_INFO Default key is Z
        if IsControlPressed(1, 20) then
          mainMenu:Visible(true)
        end

        if IsControlJustReleased(1, 20) then
            mainMenu:Visible(false)
        end
    end
end)

