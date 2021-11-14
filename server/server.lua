local QBCore = exports['qb-core']:GetCoreObject()
local rentout = 0

RegisterNetEvent('rental:server:paybike', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    local price = data.price
    if rentout >= Config.MaxRental then
        TriggerClientEvent('QBCore:Notify', src, "You have too many rentals out.", "error", "3500")
    else
        if cash >= price then
            rentout = rentout+1
            TriggerClientEvent("rental:client:spawnbike", src, data)
            Player.Functions.RemoveMoney('cash', price)
        elseif bank >= price then
            rentout = rentout+1
            TriggerClientEvent("rental:client:spawnbike", src, data)
            Player.Functions.RemoveMoney('bank', price)
        else
            TriggerClientEvent('QBCore:Notify', src, "Not enough money to rent.", "error", "1500")
        end
    end
end)

RegisterNetEvent('rental:server:repay', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    rentout = rentout-1
    Player.Functions.AddMoney('cash', Config.Repay)
    TriggerClientEvent('QBCore:Notify', src, "You were given back $"..Config.Repay.."", "success", "3500")
end)