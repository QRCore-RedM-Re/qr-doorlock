-- Single Door Config Example --
local SingleDoors = { -- front door
    {
        jobs = { 'example' }, -- Strings or Tables
        gangs = { 'example' }, -- Strings or Tables
        doorid = 1988748538, -- Object ID
        objCoords = vector3(0, 0, 0), -- Door Coords
        objYaw = 10.0, -- Heading of Door
        locked = true, -- Locked on Load
        distance = 3.0 -- Interact Distance
    }
}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

-- Double Door Config Example --
local DoubleDoors = { -- front door
    {
        jobs = { 'example' }, -- Strings or Tables
        gangs = { 'example' }, -- Strings or Tables
        locked = true, -- Locked on Load
        distance = 3.0, -- Interact Distance
        double = {
            {
                objYaw = 90.0, -- Heading of Door
                doorid = 3410720590, -- Object ID
                objCoords = vector3(0, 0, 0) -- Door Coords
            },
            {
                objYaw = 90.0, -- Heading of Door
                doorid = 3821185084, -- Object ID
                objCoords = vector3(0, 0, 0) -- Door Coords
            }
        }
    },
}