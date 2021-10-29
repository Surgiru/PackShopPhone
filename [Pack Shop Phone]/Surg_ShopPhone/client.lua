ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)



------------ Création du Menu / Sous Menu -----------

RMenu.Add('example', 'main', RageUI.CreateMenu("Magasin", "Magasin"))

Citizen.CreateThread(function()

    while true do

        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()



            RageUI.ButtonWithStyle("Carte-Sim", "Achetez une Carte Sim !", {RightLabel = "~g~50$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('Buysim')
                end
            end)

            RageUI.ButtonWithStyle("Téléphone", "Achetez un Téléphone !", {RightLabel = "~g~1200$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('Buytel')
                end
            end)              

            end, function()
            end, 1)

            Citizen.Wait(0)
        end
    end)







    ---------------------------------------- Position du Menu --------------------------------------------



local position = {
    {x = 150.69 , y = -229.78, z = 54.42, }
}    

    

    

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            for k in pairs(position) do

                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

    

                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Appuyez sur [~b~E~w~] pour acceder au ~b~Magasin",
                        time_display = 1
                    })

                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_stwhi_01")
    
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_stwhi_01", 150.69, -229.78, 53.88, 337.17, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)


--blips

Citizen.CreateThread(function()

    local blip = AddBlipForCoord(151.34, -226.81, 54.42)

    SetBlipSprite(blip, 76)
    SetBlipColour(blip, 45)
    SetBlipScale(blip, 0.80)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Apple Store")
    EndTextCommandSetBlipName(blip)
end)
