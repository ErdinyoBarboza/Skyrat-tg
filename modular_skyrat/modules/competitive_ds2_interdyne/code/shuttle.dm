/obj/machinery/computer/shuttle/interdyne_shuttle
	name = "interdyne transport shuttle helm"
	desc = "The terminal used to control the transport shuttle."
	shuttleId = "interdyneshuttle"
	possible_destinations = "interdyne_shuttle_mining;interdyne_shuttle_away;interdyne_shuttle_dock;interdyne_smuggler"
	circuit = /obj/item/circuitboard/computer/syndicate_shuttle
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
	//req_access = list(ACCESS_SYNDICATE)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/shuttle/interdyne_shuttle/launch_check(mob/user)
	return TRUE

// /obj/machinery/computer/shuttle/interdyne_shuttle/allowed(mob/to_check)
// 	if(issilicon(to_check) && !(ROLE_SYNDICATE in to_check.faction))
// 		return FALSE
// 	return ..()

/obj/machinery/computer/shuttle/interdyne_shuttle/recall
	name = "transport shuttle recall terminal"
	desc = "Use this if your coworkers left you behind."
	possible_destinations = "interdyne_shuttle_away;interdyne_shuttle_dock"

/datum/map_template/shuttle/interdyne_shuttle
	name = "interdyne transport shuttle cruiser"
	prefix = "_maps/shuttles/skyrat/"
	port_id = "interdyne"
	suffix = "shuttle"
	who_can_purchase = null

/area/shuttle/interdyne_shuttle
	name = "Interdyne Transport Shuttle"

/////////////////////////////////////////////INTERDYNE MINING ////////////////////////////////////////////////


/turf/closed/wall/mineral/titanium/shuttle_wall/mining_large/syndi
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/mining_large_syndi.dmi'
	icon_state = "2,2"
	dir = NORTH

/turf/closed/wall/mineral/titanium/shuttle_wall/window/mining_large/syndi
	icon = 'modular_skyrat/modules/advanced_shuttles/icons/mining_large_syndi.dmi'
	icon_state = "6,3"
	dir = NORTH

