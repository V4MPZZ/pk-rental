local QBCore = exports['qb-core']:GetCoreObject()

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
                    event = "rental:client:rentbike",
                    args = {
                        bike = v.modelhash,
                        price = v.price
                    }
                }
            }
        end
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('rental:client:rentbike', function(data)
    TriggerServerEvent('rental:server:paybike', data)
end)

RegisterNetEvent('rental:client:spawnbike')
AddEventHandler('rental:client:spawnbike', function(data)
    QBCore.Functions.SpawnVehicle(data.bike, function(veh)
        SetVehicleNumberPlateText(veh, "RENT"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetEntityHeading(veh, 250.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    end, vector3(-249.0394, -952.4588, 31.220005), true)
end)
