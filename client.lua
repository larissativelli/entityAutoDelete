Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        for k, v in pairs(cfg.pools) do 
            local verify = GetGamePool(v)

            blockList(verify)
        end
    end
end)

function blockList(verify)
    for k,v in pairs(verify) do
        for l,b in pairs(cfg.models) do
            if GetEntityModel(v) == GetHashKey(b) then
                DeleteEntity(v)
            end
        end
    end
end

--------------------------------

--Comando para teste de spawn de entidades. Apenas iguale "entity" ao nome do prop/ped/veículo. Para deletá-lo automaticamente, coloque-o na tabela do cfg.lua.
--Entity spawn test command. Just equate "entity" to the prop/ped/vehicle name. To automatically delete it, place it in the cfg.lua table.


--[[ RegisterCommand("spawnentity", function(source)
    local ped = PlayerPedId()
    local player_cds = GetEntityCoords(ped)
    local entity =  ""
    local hash = GetHashKey(entity)

    if IsModelAPed(hash) then
        RequestModel(hash)
        
        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        
        local npc = CreatePed(4, hash, player_cds, GetEntityHeading(ped), true, false)

        SetEntityAsMissionEntity(npc, true, true)
        
    elseif IsModelAVehicle(hash) then
        RequestModel(hash)
        
        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        
        local vehicle = CreateVehicle(hash, player_cds, GetEntityHeading(ped), true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
               
    else
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)    
        end
        
        local object = CreateObject(hash, player_cds, true, true, true)
        PlaceObjectOnGroundProperly(object)
        SetEntityAsMissionEntity(object, true, true)
        FreezeEntityPosition(object, true)

    end
end) ]]