--[[
Copyright (c) 2022, Sandy Development
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
--]]

CreateThread(function()
	while true do
	    playerped = PlayerPedId() -- Get player ped
	    person_owns_vehicle = IsPedTryingToEnterALockedVehicle(playerped) -- This is going to be used for the next version. 	
	    player_is_emerg_driver = false	
	    player_is_own_vehicle = false
	    veh = GetVehiclePedIsUsing(playerped) -- Get vehicle ped is in
			
	    if IsVehicleSirenOn(veh) and IsPedInAnyVehicle(playerped, true) and IsControlPressed(0, 49) then
		player_is_emerg_driver = true
		SetVehicleSiren(veh, false)
		Wait(1)
		SetVehicleSiren(veh, true)
		player_is_emerg_driver = false
		player_is_own_vehicle = true
    		end
	    if player_is_own_vehicle then
		SetVehicleDoorsLockedForAllPlayers(veh, true)
		player_is_own_vehicle = false
        -- More to be added here, newer version soon.
		end
	Wait(0)
	end
end)
