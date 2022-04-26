//Lavaland Ruins
//NOTICE: /unpowered means you never get power. Thanks Fikou

/area/ruin/powered/beach
	icon_state = "dk_yellow"

/area/ruin/powered/clownplanet
	name = "\improper Clown Planet"
	icon_state = "dk_yellow"
	ambientsounds = list('sound/ambience/clown.ogg')

/area/ruin/unpowered/gaia
	name = "\improper Patch of Eden"
	icon_state = "dk_yellow"

/area/ruin/powered/snow_biodome
	icon_state = "dk_yellow"

/area/ruin/powered/gluttony
	icon_state = "dk_yellow"

/area/ruin/powered/golem_ship
	name = "\improper Free Golem Ship"
	icon_state = "dk_yellow"

/area/ruin/powered/greed
	icon_state = "dk_yellow"

/area/ruin/unpowered/hierophant
	name = "\improper Hierophant's Arena"
	icon_state = "dk_yellow"

/area/ruin/powered/pride
	icon_state = "dk_yellow"

/area/ruin/powered/seedvault
	icon_state = "dk_yellow"

/area/ruin/unpowered/elephant_graveyard
	name = "\improper Elephant Graveyard"
	icon_state = "dk_yellow"

/area/ruin/powered/graveyard_shuttle
	name = "\improper Elephant Graveyard"
	icon_state = "green"

/area/ruin/syndicate_lava_base
	name = "\improper Secret Base"
	icon_state = "dk_yellow"
	ambience_index = AMBIENCE_DANGER

/area/ruin/unpowered/cultaltar
	name = "\improper Cult Altar"
	area_flags = CULT_PERMITTED
	ambience_index = AMBIENCE_SPOOKY

//Syndicate lavaland base

/area/ruin/syndicate_lava_base/engineering
	name = "Interdyne Engineering" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "engine"

/area/ruin/syndicate_lava_base/medbay
	name = "Interdyne Medbay" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "medbay"

/area/ruin/syndicate_lava_base/arrivals
	name = "Interdyne Arrivals" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "entry"

/area/ruin/syndicate_lava_base/bar
	name = "\improper Interdyne Bar" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "bar"

/area/ruin/syndicate_lava_base/main
	name = "\improper Interdyne Primary Hallway" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "hallC"

/area/ruin/syndicate_lava_base/cargo
	name = "\improper Interdyne Cargo Bay" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "cargo_bay"

/area/ruin/syndicate_lava_base/chemistry
	name = "\improper Interdyne Chemistry" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "chem"

/area/ruin/syndicate_lava_base/virology
	name = "\improper Interdyne Virology" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "virology"

/area/ruin/syndicate_lava_base/testlab
	name = "\improper Interdyne Experimentation Lab" // SKYRAT EDIT STEALTH INTERDYNE
	area_flags = XENOBIOLOGY_COMPATIBLE //SKYRAT EDIT ADDITION - MAPPING
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "exp_lab"

/area/ruin/syndicate_lava_base/dormitories
	name = "\improper Interdyne Dormitories" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "dorms"

/area/ruin/syndicate_lava_base/telecomms
	name = "\improper Interdyne Telecommunications" // SKYRAT EDIT STEALTH INTERDYNE
	always_unpowered = FALSE // SKYRAT EDIT ADDITION - SYNDIEBROKE
	icon_state = "tcomsatcham"

//Xeno Nest

/area/ruin/unpowered/xenonest
	name = "The Hive"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
//ash walker nest
/area/ruin/unpowered/ash_walkers
	icon_state = "red"
	//SKYRAT EDIT ADDITION BEGIN - ASH WALKER MACHINES FIX
	always_unpowered = FALSE
	power_equip = TRUE
	//SKYRAT EDIT ADDITION END

/area/ruin/unpowered/ratvar
	icon_state = "dk_yellow"
	outdoors = TRUE
