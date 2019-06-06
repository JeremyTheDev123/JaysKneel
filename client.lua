---Coded by Jeremiah#0420
RegisterCommand("k", function(source,args,rawCommand)
    HandsupKneel()
end, false)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

---HandsupKneel Code
function HandsupKneel()
    ped = PlayerPedId()
    if DoesEntityExist(ped) then
        Citizen.CreateThread(function()
            playAnim("random@arrests@busted")
            if IsEntityPlayingAnim(ped, "random@arrests@busted", "idle_a", 3)then
                ClearPedTasksImmediately(ped)
			elseif not IsEntityPlayingAnim(ped, "random@arrests@busted", "idle_a", 3) then
                TaskPlayAnim(ped, "random@arrests@busted", "idle_a", 8.0, -8, -1, 49, 0, 0, 0, 0)
                TaskPlayAnim(ped, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0) 
			end
		end)
	end
end

---Disable controls while hands are up.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "idle_a", 3) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 23, true)
            DisableControlAction(1, 25, true)
            DisableControlAction(0,21,true)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            
        end
    end
end)