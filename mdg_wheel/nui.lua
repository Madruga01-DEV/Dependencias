local display = false
 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("VehicleWheelWasFixed", function(data)
    print("FIX")
    TriggerEvent("mdg_stables:fix_this_cart", true)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
        if IsControlJustPressed(0, 172) then
			SetDisplay(true)
		end
		if IsControlJustPressed(0, 173) then
			SetDisplay(false)
		end
    end
end)


RegisterNetEvent('fix_wheel')
AddEventHandler('fix_wheel', function()
    SetDisplay(true);
end)
