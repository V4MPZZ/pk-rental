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
            txt = "Rent a bicycle",
            params = {
                event = "rental:client:rentmenu",
            }
        },
    })
end)

RegisterNetEvent('rental:client:rentmenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "BMX",
            txt = "Allegedly Tony Hawk donated this bike",
            params = {
                event = "rental:client:rentbike",
                args = {
                    bike = 'bmx'
                }
            }
        },
    })
end)

RegisterNetEvent('rental:client:rentbike', function(data)
    TriggerServerEvent('rental:server:paybike', data)
end)
