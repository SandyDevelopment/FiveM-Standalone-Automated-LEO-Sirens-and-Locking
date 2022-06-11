# FiveM-Standalone-Automated-LEO-Sirens-and-Locking
Sandy Development.

**Information**

This script is designed to automatically disable the sirens of an LEO vehicle and also automatically lock the door. 

If the vehicle has sirens and lights on, and if the officer exits the vehicle, it will stop the sirens keeping the lights on automatically and also lock the door. This can help prevent the vehicle from being stolen, or any FRP occuring.

If using vMenu lock, ensure to set the vehicle to your personal vehicle in order to ensure you do not get locked out. In the future, there will be updates adding our own custom vehicle lock script integrated into this to be more efficient. Join the discord to keep up with the updates or if you require further assistance.  

**How to install**

1. Move resource into your server resources folder
2. Paste the following into your `server.cfg`

```start SD-Automated-LEO-and-Locking```

**FOR SUPPORT, JOIN OUR DISCORD**
https://discord.gg/aWtauUMK7j


QB Client.lua:
```
-- Siren & Lock Doors (Police) --

CreateThread(function()

    while true do

    playerped = PlayerPedId()

    person_owns_vehicle = IsPedTryingToEnterALockedVehicle(playerPed)

    player_is_emerg_driver = false

    player_is_own_vehicle = false

    veh = GetVehiclePedIsUsing(playerped)

    if IsVehicleSirenOn(veh) and IsPedInAnyVehicle(playerped, true) and IsControlPressed(0, 49) then

        player_is_emerg_driver = true

        SetVehicleSiren(veh, false)

        Wait(1)

        --SetPlayersLastVehicle(veh)

        SetVehicleSiren(veh, true)

        player_is_emerg_driver = false

        player_is_own_vehicle = true

    end

    if player_is_own_vehicle then

        -- SetVehicleDoorsLockedForAllPlayers(veh, true)

        SetVehicleDoorsLocked(veh, 2)

        QBCore.Functions.Notify("Vehicle locked!", "primary")                    

        player_is_own_vehicle = false

        -- More to be added here, newer version soon.

        end

    Wait(0)

    end

end)
```

- Thanks to LlamaPalooza for letting us know this.
