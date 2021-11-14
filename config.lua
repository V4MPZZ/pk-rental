Config = {}

Config.Draw3D = true -- If false then make sure you use another script to trigger the event

Config.MaxRental = 3 -- Max rentals allowed out at once without returning them

Config.BlipCoords = {
    [1] = {
        label = 'Bike Rental', -- Name shown when you click on the blip
        coords = vector3(0.0, 0.0, 0.0) -- The location to place the blip on the map
    },
    [2] = {
        label = '', -- Name shown when you click on the blip
        coords = vector3(0.0, 0.0, 0.0) -- The location to place the blip on the map
    }
}

Config.Repay = 15 -- How much you want the player to get payed for returning a vehicle (Temporary Solution)

Config.RentLocation = { -- The location to draw the text to open menu
    [1] = {
        label = '[E] - Rent', -- The text of the text shown at the coords
        coords = vector3(0.0, 0.0, 0.0) -- The location to draw the text to open menu
    },
    [2] = {
        label = '', -- The text of the text shown at the coords
        coords = vector3(0.0, 0.0, 0.0) -- The location to draw the text to open menu
    }
}

Config.ReturnLocation = {
    [1] = {
        label = '[E] - Return', -- The text of the text shown at the coords
        coords = vector3(0.0, 0.0, 0.0) -- The location to draw the text to return your vehicle
    },
    [2] = {
        label = '', -- The text of the text shown at the coords
        coords = vector3(0.0, 0.0, 0.0) -- The location to draw the text to return your vehicle
    }
}

Config.SpawnLocation = vector3(0.0, 0.0, 0.0) -- Where to spawn the vehicle (this will be overhauled in the future)

Config.Cycles = {
    [1] = {
        label = 'BMX', -- Title in qb-menu
        info = 'Do some sick tricks.', -- Description in qb-menu
        price = 15, -- Price of Rental
        modelhash = 'bmx' -- Vehicle spawn code goes here
    },
    [2] = {
        label = '', -- Title in qb-menu
        info = '', -- Description in qb-menu
        price = 0, -- Price of Rental
        modelhash = '' -- Vehicle spawn code goes here
    }
}