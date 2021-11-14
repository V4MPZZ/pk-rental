local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rental:server:paybike', function(data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local coords = vector3(-249.0394, -952.4588, 31.220005)
    if data.bike == 'bmx' then price = 25.0
        if xPlayer.Functions.RemoveMoney('cash', price) then
            QBCore.Functions.SpawnVehicle('bmx', function(veh)
                SetVehicleNumberPlateText(veh, "RENT"..tostring(math.random(1000, 9999)))
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                SetEntityHeading(veh, 250.0)
                TriggerClientEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            end, coords, true)
        else
            QBCore.Functions.Notify("Not enough money to rent.", "error", "1500")
        end
    end
end)