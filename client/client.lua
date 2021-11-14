local QBCore = exports['qb-core']:GetCoreObject()

local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

if Config.Draw3D then
    CreateThread(function()
        while true do
            sleep = 2000
            if LocalPlayer.state['isLoggedIn'] then
                local pos = GetEntityCoords(PlayerPedId())
                local coords = Config.RentLocation
                if #(pos - coords) < 5 then
                    sleep = 5
                    if #(pos - coords) < 1.2 then
                        DrawText3D(coords.x, coords.y, coords.z, "[E] - Rent")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent('rental:client:mainmenu')
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

RegisterNetEvent('rental:client:mainmenu')
AddEventHandler('rental:client:mainmenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Rental Actions",
            isMenuHeader = true,
        },
        {
            header = "Cycles",
            txt = "Rent a bicycle.",
            params = {
                event = "rental:client:rentmenu",
            }
        },
    })
end)

RegisterNetEvent('rental:client:rentmenu', function()
    local Menu = {}
        for k, v in pairs(Config.Cycles) do
            Menu[#Menu+1] = {
                header = v.label,
                txt = v.info,
                params = {
                    isServer = true,
                    event = "rental:server:paybike",
                    args = {
                        bike = v.modelhash,
                        price = v.price
                    }
                }
            }
        end
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('rental:client:spawnbike', function(data)
    QBCore.Functions.SpawnVehicle(data.bike, function(veh)
        SetVehicleNumberPlateText(veh, "RENT"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetEntityHeading(veh, 250.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    end, vector3(-249.0394, -952.4588, 31.220005), true)
end)
