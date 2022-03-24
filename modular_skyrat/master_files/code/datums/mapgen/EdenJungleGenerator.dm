/datum/map_generator/jungle_generator/eden
	///2D list of all biomes based on heat and humidity combos.
	possible_biomes = list(
	BIOME_LOW_HEAT = list(
		BIOME_LOW_HUMIDITY = /datum/biome/eden_plains,
		BIOME_LOWMEDIUM_HUMIDITY = /datum/biome/eden_mudlands,
		BIOME_HIGHMEDIUM_HUMIDITY = /datum/biome/eden_mudlands,
		BIOME_HIGH_HUMIDITY = /datum/biome/eden_water
		),
	BIOME_LOWMEDIUM_HEAT = list(
		BIOME_LOW_HUMIDITY = /datum/biome/eden_plains,
		BIOME_LOWMEDIUM_HUMIDITY = /datum/biome/eden_jungle,
		BIOME_HIGHMEDIUM_HUMIDITY = /datum/biome/eden_jungle,
		BIOME_HIGH_HUMIDITY = /datum/biome/eden_mudlands
		),
	BIOME_HIGHMEDIUM_HEAT = list(
		BIOME_LOW_HUMIDITY = /datum/biome/eden_plains,
		BIOME_LOWMEDIUM_HUMIDITY = /datum/biome/eden_plains,
		BIOME_HIGHMEDIUM_HUMIDITY = /datum/biome/eden_jungle/deep,
		BIOME_HIGH_HUMIDITY = /datum/biome/eden_jungle
		),
	BIOME_HIGH_HEAT = list(
		BIOME_LOW_HUMIDITY = /datum/biome/eden_wasteland,
		BIOME_LOWMEDIUM_HUMIDITY = /datum/biome/eden_plains,
		BIOME_HIGHMEDIUM_HUMIDITY = /datum/biome/eden_jungle,
		BIOME_HIGH_HUMIDITY = /datum/biome/eden_jungle/deep
		)
	)
	///Used to select "zoom" level into the perlin noise, higher numbers result in slower transitions
	perlin_zoom = 65

/area/mine/planetgeneration/eden
	name = "eden planet generation area"
	static_lighting = FALSE
	base_lighting_alpha = 255

	map_generator = /datum/map_generator/jungle_generator/eden
