ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

Keys = {
    ["ESC"]       = 322,  ["F1"]        = 288,  ["F2"]        = 289,  ["F3"]        = 170,  ["F5"]  = 166,  ["F6"]  = 167,  ["F7"]  = 168,  ["F8"]  = 169,  ["F9"]  = 56,   ["F10"]   = 57, 
    ["~"]         = 243,  ["1"]         = 157,  ["2"]         = 158,  ["3"]         = 160,  ["4"]   = 164,  ["5"]   = 165,  ["6"]   = 159,  ["7"]   = 161,  ["8"]   = 162,  ["9"]     = 163,  ["-"]   = 84,   ["="]     = 83,   ["BACKSPACE"]   = 177, 
    ["TAB"]       = 37,   ["Q"]         = 44,   ["W"]         = 32,   ["E"]         = 38,   ["R"]   = 45,   ["T"]   = 245,  ["Y"]   = 246,  ["U"]   = 303,  ["P"]   = 199,  ["["]     = 116,  ["]"]   = 40,   ["ENTER"]   = 18,
    ["CAPS"]      = 137,  ["A"]         = 34,   ["S"]         = 8,    ["D"]         = 9,    ["F"]   = 23,   ["G"]   = 47,   ["H"]   = 74,   ["K"]   = 311,  ["L"]   = 182,
    ["LEFTSHIFT"] = 21,   ["Z"]         = 20,   ["X"]         = 73,   ["C"]         = 26,   ["V"]   = 0,    ["B"]   = 29,   ["N"]   = 249,  ["M"]   = 244,  [","]   = 82,   ["."]     = 81,
    ["LEFTCTRL"]  = 36,   ["LEFTALT"]   = 19,   ["SPACE"]     = 22,   ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213,  ["PAGEUP"]    = 10,   ["PAGEDOWN"]  = 11,   ["DELETE"]    = 178,
    ["LEFT"]      = 174,  ["RIGHT"]     = 175,  ["UP"]        = 27,   ["DOWN"]      = 173,
    ["NENTER"]    = 201,  ["N4"]        = 108,  ["N5"]        = 60,   ["N6"]        = 107,  ["N+"]  = 96,   ["N-"]  = 97,   ["N7"]  = 117,  ["N8"]  = 61,   ["N9"]  = 118
}

Citizen.CreateThread(function()
            local coords = Config.Coords
            local hash = GetHashKey("a_m_m_soucent_01")
            while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
            end
            ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_m_soucent_01", coords, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            FreezeEntityPosition(ped, true)
	    SetEntityInvincible(ped, true)
    while true do
        local Player = PlayerPedId()
        local PPos = GetEntityCoords(Player)
                    local _s = 1000
                    if #(PPos - vector3(250.6839, -790.143, 29.423)) < 3 then
                        _s = 0
                        DrawText3D(250.6839, -790.143, 30.423 +1, "Pulsa ~y~[E]~w~ para abrir el Menú de TP a barrios")
                        if IsControlJustPressed(1, Keys['E']) then
                            openMenu()
                    end
            end
        Citizen.Wait(_s)
    end
end)

function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function openMenu()
    local elements = {
    {label = 'Barrio Ballas', value = 'barrioballas'},
    {label = 'Barrio Families', value = 'barriofamilies'},
    {label = 'Barrio White Families', value = 'barriowhitefamilies'},
    {label = 'Barrio Vagos', value = 'barriovagos'},
}

ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'NpcTPGangs',{
    title = 'Menú TP a barrio',
    align = 'bottom-right',
    elements = elements
},
function(data, menu)
        if data.current.value == 'barrioballas' then
        ESX.Game.Teleport(PlayerPedId(), {x=98.81587, y=-1951.69, z=21.662, heading=334.90}, function()
        TriggerEvent('chatMessage', '[TP a barrios]', {255, 0, 0}, (_U('ballas_message')))
        menu.close()
    end)
        elseif data.current.value == 'barriowhitefamilies' then
        ESX.Game.Teleport(PlayerPedId(), {x=471.3062, y=-1567.06, z=30.282, heading=226.509}, function()
     TriggerEvent('chatMessage', '[TP a barrios]', {255, 0, 0}, (_U('whitefamilies_message')))
     menu.close()
        end)
    elseif data.current.value == 'barriofamilies' then
    ESX.Game.Teleport(PlayerPedId(), {x=-103.614, y=-1593.16, z=32.503, heading=314.816}, function()
        TriggerEvent('chatMessage', '[TP a barrios]', {255, 0, 0}, (_U('families_message')))
        menu.close()
    end)
elseif data.current.value == 'barriovagos' then
    ESX.Game.Teleport(PlayerPedId(), {x=1381.261, y=-581.868, z=75.374, heading=75.37}, function()
        TriggerEvent('chatMessage', '[TP a barrios]', {255, 0, 0}, (_U('vagos_message')))
        menu.close()
    end)
    end
end,
function(data, menu)
    menu.close()
    end)
end
