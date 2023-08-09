-- EXAMPLES FOR SINGLE & DOUBLE DOOR CONFIGS PROVIDED IN 'EXAMPLES.lua' 

Doors = {}

Doors.UnlockedDoors = {
	586229709, -- Saint Denis Medic
    3804893186, -- Saint Denis Clothing Store
    3277501452, -- Blackwater Clothing Store
    3208189941, -- Tumbleweed Clothing Store
    94437577, -- Strawberry Clothing Store
    2432590327, -- Rhodes Clothing Store

	-- Valentine Savings Bank
	2642457609, -- main door
	3886827663, -- main door
	1340831050, -- bared right
	2343746133, -- bared left
	334467483, -- inner door1
	3718620420, -- inner door2
	576950805, -- vault door

	-- Bank of Rhodes
	3317756151, -- main door
	3088209306, -- main door
	2058564250, -- inner door1
	3142122679, -- inner door2
	1634148892, -- inner door3
	3483244267, -- vault

	-- Lemoyne National Bank Saint Denis
	2158285782, -- main door
	1733501235, -- main door
	2089945615, -- main door
	2817024187, -- main door
	1830999060, -- inner private door
	965922748, -- manager door
	1634115439, -- manager door
	1751238140, -- vault

	-- West Elizabeth Co-Operative Bank Blackwater
	531022111, -- main door
	2117902999, -- inner door
	2817192481, -- manager door
	1462330364, -- vault door

	-- Bank of Armadillo
	3101287960, -- main door
	3550475905, -- inner door
	1329318347, -- inner door
	1366165179, -- back door
}

Doors.List = {
	-----------------------------------------------------
	-- Valentine Sheriff Office
	-----------------------------------------------------
	{ -- front door
		jobs = { 'police' },
		doorid = 1988748538,
		objCoords = vector3(-276.0126037597656, 802.591064453125, 118.41165161132812),
		objYaw = 10.0,
		locked = true,
		distance = 2.0
	},
	{ -- back door
		jobs = { 'police' },
		doorid = 395506985,
		objCoords = vector3(-275.8447570800781, 812.0270385742188, 118.41483306884766),
		objYaw = -170.0,
		locked = true,
		distance = 2.0
	},
	{ -- cells back door
		jobs = { 'police' },
		doorid = 1508776842,
		objCoords = vector3(-270.76641845703125, 810.0264892578125, 118.39580535888672),
		objYaw = -80.0,
		locked = true,
		distance = 1.5
	},
	{ --cell area
		jobs = { 'police' },
		doorid = 535323366,
		objCoords = vector3(-275.0232849121094, 809.2740478515625, 118.36856842041016),
		objYaw = -80.0,
		locked = true,
		distance = 1.5
	},
	{ --cell-1
		jobs = { 'police' },
		doorid = 295355979,
		objCoords = vector3(-273.4643249511719, 809.966064453125, 118.36823272705078),
		objYaw = 10.0,
		locked = true,
		distance = 1.5
	},
	{ -- cell-2
		jobs = { 'police' },
		doorid = 193903155,
		objCoords = vector3(-272.0520935058594, 808.25830078125, 118.36851501464844),
		objYaw = -170.0,
		locked = true,
		distance = 1.5
	},

	-----------------------------------------------------
	-- Rhodes Sheriff Office
	-----------------------------------------------------
	{
		jobs = { 'police' }, -- front door
		doorid = 349074475,
		objCoords = vector3(1359.710205078125, -1305.9600830078125, 76.76842498779297),
		objYaw = 160.0,
		locked = true,
		distance = 2.0
	},
	{
		jobs = { 'police' }, -- back door
		doorid = 1614494720,
		objCoords = vector3(1359.097900390625, -1297.5343017578125, 76.78761291503906),
		objYaw = -110.0,
		locked = true,
		distance = 2.0
	},
	{
		jobs = { 'police' }, -- cell
		doorid = 1878514758,
		objCoords = vector3(1357.3343505859375, -1302.4530029296875, 76.76018524169922),
		objYaw = 70.0,
		locked = true,
		distance = 1.5
	},
	-----------------------------------------------------
	-- Blackwater Sheriff Office
	-----------------------------------------------------
	{
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = 90.0,
				doorid = 3410720590,
				objCoords = vector3(-757.0421752929688, -1268.485107421875, 43.068603515625)
			},
			{
				objYaw = 90.0,
				doorid = 3821185084,
				objCoords = vector3(-757.0421142578125, -1269.9234619140625, 43.06863021850586)
			}
		}
	},
	{
		jobs = { 'police' }, -- back door
		doorid = 2810801921,
		objCoords = vector3(-769.1370849609375, -1268.7451171875, 43.0400390625),
		objYaw = -90.0,
		locked = true,
		distance = 2.0
	},
	{
		jobs = { 'police' }, -- cell-1
		doorid = 2167775834,
		objCoords = vector3(-763.52783203125, -1262.4608154296875, 43.02327346801758),
		objYaw = -90.0,
		locked = true,
		distance = 1.5
	},
	{
		jobs = { 'police' }, -- cell-2
		doorid = 2514996159,
		objCoords = vector3(-765.8607788085938, -1264.7044677734375, 43.02326965332031),
		objYaw = 90.0,
		locked = true,
		distance = 1.5
	},
	-----------------------------------------------------
	-- Strawberry Sheriff Office
	-----------------------------------------------------
	{ -- front door
		jobs = { 'police' },
		doorid = 1821044729,
		objCoords = vector3(-1806.6751708984375, -350.31280517578125, 163.64759826660156),
		objYaw = -115.0,
		locked = true,
		distance = 2.0
	},
	{ -- cell-1
		jobs = { 'police' },
		doorid = 902070893,
		objCoords = vector3(-1814.400390625, -353.1470947265625, 160.44180297851562),
		objYaw = -115.0,
		locked = true,
		distance = 1.5
	},
	{  -- cell-2
		jobs = { 'police' },
		doorid = 1207903970,
		objCoords = vector3(-1812.0101318359375, -351.92095947265625, 160.46839904785156),
		objYaw = -25.0,
		locked = true,
		distance = 1.5
	},
	{ -- back door
		jobs = { 'police' },
		doorid = 1514359658,
		objCoords = vector3(-1812.669189453125, -345.08489990234375, 163.64759826660156),
		objYaw = -115.0,
		locked = true,
		distance = 2.0
	},
	-----------------------------------------------------
	-- Saint Denis HQ Office
	-----------------------------------------------------
	{ -- outside double doors
		jobs = { 'police' },
		locked = false,
		distance = 2.0,
		double = {
			{
				objYaw = 90.0,
				doorid = 417663242,
				objCoords = vector3(2516.144287109375, -1309.9276123046875, 47.95257186889648)
			},
			{
				objYaw = -90.0,
				doorid = 1611175760,
				objCoords = vector3(2516.14453125, -1307.724853515625, 47.95257186889648)
			}
		}
	},
	{ -- inside double doors (left)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = -90.0,
				doorid = 3601535313,
				objCoords = vector3(2510.90771484375, -1312.2154541015625, 47.95257186889648)
			},
			{
				objYaw = -90.0,
				doorid = 3430284519,
				objCoords = vector3(2510.90771484375, -1310.4840087890625, 47.95257186889648)
			}
		}
	},
	{ -- inside double doors (right)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = -90.0,
				doorid = 3124713594,
				objCoords = vector3(2510.90771484375, -1307.141357421875, 47.95716857910156)
			},
			{
				objYaw = -90.0,
				doorid = 1879655431,
				objCoords = vector3(2510.90771484375, -1305.41162109375, 47.95716857910156)
			}
		}
	},
	{ -- outside double doors (side-1)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = 180.0,
				doorid = 1020479727,
				objCoords = vector3(2508.337646484375, -1317.2796630859375, 47.95257186889648)
			},
			{
				objYaw = 180.0,
				doorid = 603068205,
				objCoords = vector3(2506.606201171875, -1317.2796630859375, 47.95257186889648)
			}
		}
	},
	{ -- outside double doors (side-2)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = 180.0,
				doorid = 305296302,
				objCoords = vector3(2497.684814453125, -1317.28271484375, 47.95257186889648)
			},
			{
				objYaw = 180.0,
				doorid = 2503834054,
				objCoords = vector3(2495.953369140625, -1317.28271484375, 47.95257186889648)
			}
		}
	},
	{ -- outside double doors (back-1)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = 90.0,
				doorid = 1992193795,
				objCoords = vector3(2493.37255859375, -1311.95654296875, 47.95257186889648)
			},
			{
				objYaw = 90.0,
				doorid = 1694749582,
				objCoords = vector3(2493.37255859375, -1310.2252197265625, 47.95257186889648)
			}
		}
	},
	{ -- outside double doors (back-2)
		jobs = { 'police' },
		locked = true,
		distance = 2.0,
		double = {
			{
				objYaw = 90.0,
				doorid = 1979938193,
				objCoords = vector3(2493.37255859375, -1307.41845703125, 47.95257186889648)
			},
			{
				objYaw = 90.0,
				doorid = 1674105116,
				objCoords = vector3(2493.37255859375, -1305.68701171875, 47.95257186889648)
			}
		}
	},
	{ -- cell-1
		jobs = { 'police' },
		doorid = 3365520707,
		objCoords = vector3(2498.5, -1307.85595703125, 47.95327377319336),
		objYaw = 0.0,
		locked = true,
		distance = 1.5
	},
	{ -- cell-2
		jobs = { 'police' },
		doorid = 1995743734,
		objCoords = vector3(2499.752197265625, -1309.8763427734375, 47.95327377319336),
		objYaw = 180.0,
		locked = true,
		distance = 1.5
	},
	{ -- cell-3
		jobs = { 'police' },
		doorid = 1711767580,
		objCoords = vector3(2502.4296875, -1307.85595703125, 47.95327377319336),
		objYaw = 0.0,
		locked = true,
		distance = 1.3
	},
	{ -- cell-4
		jobs = { 'police' },
		doorid = 2515591150,
		objCoords = vector3(2503.638671875, -1309.8763427734375, 47.95327377319336),
		objYaw = 180.0,
		locked = true,
		distance = 1.3
	},
}