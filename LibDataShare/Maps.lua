local lib = LibDataShare

-- All coordinates are relative to the Vvardenfell map, since it's the largest map used by Hodor Reflexes.
lib.maps = {
	-- Big maps.
	[2]  = {x0 = -3.6733777523041,	y0 = 0.29304328560829,	x1 = -2.8486399650574,	y1 = 1.1177809238434,	step = 2.6947350306727e-06	}, -- Glenumbra (max data: 371093^2)
	[8]  = {x0 = -2.1332890987396,	y0 = 1.8717646598816,	x1 = -1.4144645929337,	y1 = 2.5905892848969,	step = 3.0917826734367e-06	}, -- Malabal Tor (max data: 323437^2)
	[9]  = {x0 = 0.057472541928291,	y0 = 1.6256439685822,	x1 = 0.72420734167099,	y1 = 2.2923786640167,	step = 2*3.3333333249175e-06}, -- Shadowfen (max data: 150000^2)
	[31] = {x0 = -2.9090929031372,	y0 = 4.1058239936829,	x1 = -1.7993661165237,	y1 = 5.2155508995056,	step = 4.005399205198e-06	}, -- Clockwork City (max data: 249663^2)
	[36] = {x0 = -1.2486721277237,	y0 = 1.983785033226,	x1 = -0.44358313083649,	y1 = 2.7888739109039,	step = 3*2.7604939987214e-06}, -- Northern Elsweyr (max data: 120751^2)
	[38] = {x0 = -1.8832370042801,	y0 = -0.38210573792458,	x1 = -1.0016402006149,	y1 = 0.49949106574059,	step = 2*2.5209362775058e-06}, -- Western Skyrim (max data: 198339^2 - 1)
	--[45678] = {step = 2.1069886315672e-06} deadlands
	--[idk] = {step = 2.0783797936019e-06} - necrom

	-- Small maps.
	[20] = {x0 = -3.4002742767334,	y0 = 1.1236237287521,	x1 = -3.2511279582977,	y1 = 1.2727700471878,	step = 1.4901131180522e-05	}, -- Betnikh (max data: 67108^2)
	[28] = {x0 = -2.7288279533386,	y0 = 1.345197558403,	x1 = -2.228045463562,	y1 = 1.845979809761,	step = 3*4.4379553401086e-06}, -- Hew's Bane (max data: 75109^2-1)

	-- Reserved maps.
	-- These maps are already used by some addons or reserved for future needs.
	[23] = {x0 = -4.803050994873,	y0 = -0.42222094535828,	x1 = -3.8695778846741,	y1 = 0.51125228404999,	step = 2.3808390778868e-06	}, -- Coldharbour (max data: 420019^2)
	[27] = {x0 = -2.7243919372559,	y0 = -0.28404015302658,	x1 = -1.9465345144272,	y1 = 0.4938171505928,	step = 2.8571428174473e-06	}, -- Wrothgar (max data: 350000^2)

	-- Main map used by Hodor Reflexes (don't use it!)
	[30] = {x0 = 0,	y0 = 0, x1 = 1, y1 = 1, step = 0.0000022224494387046}, -- Vvardenfell (max data: 449953^2)
	-- Map used by FastReset
	[21] = {x0 = -1.0631109476089,	y0 = 3.1203346252441,	x1 = -0.88531714677811,	y1 = 3.2981283664703,	step = 2*1.2499999684223e-05}, -- Khenarthi's Roost (max data: 40000^2-1)

}

-- Calculate number of steps for each map (map's "size").
for _, v in pairs(lib.maps) do
	v.size = zo_floor(1 / v.step)
end