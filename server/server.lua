local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rental:server:paybike', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    if data.bike == 'bmx' then price = 25.0
        if cash >= price then
            TriggerClientEvent("rental:client:spawnbike", src, data)
            Player.Functions.RemoveMoney('cash', price)
        elseif bank >= price then
            TriggerClientEvent("rental:client:spawnbike", src, data)
            Player.Functions.RemoveMoney('bank', price)
        else
            TriggerClientEvent('QBCore:Notify', src, "Not enough money to rent.", "error", "1500")
        end
    end
end)