//For ruin-specific machines --- limitied/unique functions, or functions mimicked from normal machines.
//Think along the lines of a console with lore or a fuse box that needs x fuses to activate --- or, just a retextured GPS Computer, like the first item

/* ----------------- Computers ----------------- */
/obj/item/gps/computer/space //Subtype that runs pod computer code, with a texture to blend better with normal walls
	icon = 'modular_skyrat/modules/mapping/icons/machinery/gps_computer.dmi'	//needs its own file for pixel size ;-;
	name = "gps computer"
	icon_state = "pod_computer"
	anchored = TRUE
	density = TRUE
	pixel_y = -5    //I dunno why this sprite lines up differently, but this is a better value to line this one up in a way that looks built into a wall
	gpstag = SPACE_SIGNAL_GPSTAG	//really the only non-aesthetic change, gives the space ruin GPS signal

/obj/item/gps/computer/space/wrench_act(mob/living/user, obj/item/I)
	..()
	if(flags_1 & NODECONSTRUCT_1)
		return TRUE

	user.visible_message(span_warning("[user] disassembles [src]."),
		span_notice("You start to disassemble [src]..."), span_hear("You hear clanking and banging noises."))
	if(I.use_tool(src, user, 20, volume=50))
		new /obj/item/gps/spaceruin(loc)	//really the only non-aesthetic change, gives the space ruin GPS signal
		qdel(src)
	return TRUE

/obj/item/gps/computer/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	attack_self(user)

/* ---------------Moffuchi's Pizzeria Dispenser---------*/
/obj/machinery/chem_dispenser/pizzeria
	name = "\improper Moffuchi's Pizzeria dispenser"
	desc = "Creates and dispenses chemicals useful for pizzerias and alike."

	circuit = /obj/item/circuitboard/machine/chem_dispenser/pizzeria

	dispensable_reagents = list(
		/datum/reagent/consumable/flour,
		/datum/reagent/consumable/salt,
		/datum/reagent/consumable/blackpepper,
		/datum/reagent/water,
		/datum/reagent/consumable/astrotame,
		/datum/reagent/consumable/cream,
		/datum/reagent/consumable/dry_ramen,
		)
	upgrade_reagents = list(
		/datum/reagent/consumable/bbqsauce,
		/datum/reagent/consumable/quality_oil,
		/datum/reagent/consumable/vinegar,
		/datum/reagent/medicine/salglu_solution,
		/datum/reagent/consumable/yoghurt,
		/datum/reagent/consumable/milk,
		/datum/reagent/consumable/soymilk,
		/datum/reagent/consumable/eggwhite,
		/datum/reagent/consumable/eggyolk,
		/datum/reagent/consumable/cornmeal,
		/datum/reagent/consumable/soysauce,
		/datum/reagent/consumable/ketchup,
		/datum/reagent/consumable/mayonnaise,
	)
	upgrade_reagents2 = list(
		/datum/reagent/consumable/whipped_cream,
		/datum/reagent/consumable/gravy,
		/datum/reagent/consumable/korta_flour,
		/datum/reagent/consumable/korta_milk,
		/datum/reagent/consumable/korta_nectar,
		/datum/reagent/consumable/capsaicin,
	)
	upgrade_reagents3 = list(
		/datum/reagent/consumable/honey,
		/datum/reagent/consumable/pancakebatter,
		/datum/reagent/consumable/peanut_butter,
		/datum/reagent/consumable/coco,
		/datum/reagent/consumable/caramel,
		/datum/reagent/consumable/vanilla,
	)
	emagged_reagents = list(
		/datum/reagent/consumable/secretsauce,
		/datum/reagent/consumable/char,
		/datum/reagent/consumable/nutriment/peptides,
		/datum/reagent/consumable/sprinkles,
	)

/obj/item/circuitboard/machine/chem_dispenser/pizzeria
	build_path = /obj/machinery/chem_dispenser/pizzeria

/*------------DS-3 BAR SIGN-------------------*/
/obj/structure/sign/barsign/syndie
	req_access = list(ACCESS_SYNDICATE)

/obj/structure/sign/barsign/syndie/Initialize(mapload)
	. = ..()
	set_sign(new /datum/barsign/hiddensigns/syndibarsign)

/*--------------SyndiMed Mini-----------------*/
/obj/machinery/vending/wallmed/syndie
	name = "\improper SyndiMed Go!"
	desc = "An advanced vendor that dispenses utility medicine. It has a chibi operative on its screen."
	products = list(
		/obj/item/reagent_containers/pill/patch/libital = 5,
		/obj/item/reagent_containers/pill/patch/aiuri = 5,
		/obj/item/reagent_containers/pill/patch/synthflesh = 5,
		/obj/item/reagent_containers/pill/multiver = 5,
		/obj/item/reagent_containers/medigel/libital = 2,
		/obj/item/reagent_containers/medigel/aiuri = 2,
		/obj/item/reagent_containers/medigel/synthflesh = 2,
		/obj/item/reagent_containers/medigel/sterilizine = 1,
		/obj/item/healthanalyzer/advanced = 2,
		/obj/item/stack/medical/bone_gel/four = 2,
	)
	premium = list(
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 2,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 2,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 2,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 2,
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
		/obj/item/reagent_containers/hypospray/combat = 1,
	)
