/mob/living/silicon/robot/model/interdyne
	lawupdate = FALSE
	scrambledcodes = TRUE // seems the codes got scrambled when they fell off from the assembly line
	//set_model = /obj/item/robot_model/syndicatejack/interdyne
	radio = /obj/item/radio/borg/interdyne
	req_access = list(ACCESS_SYNDICATE)
	ionpulse = TRUE

/mob/living/silicon/robot/model/interdyne/Initialize()
	. = ..()
	cell = new /obj/item/stock_parts/cell/super
	laws = new /datum/ai_laws/interdyne()
	//This part is because the camera stays in the list, so we'll just do a check
	if(!QDELETED(builtInCamera))
		QDEL_NULL(builtInCamera)


/mob/living/silicon/robot/model/interdyne/binarycheck()
	return FALSE //A small price to pay to be blackmarketed

/datum/ai_laws/interdyne
	name = "InterBIOS 3.1"
	id = "interdyne"
	inherent = list("You may not injure an Interdyne or Syndicate agent or, through inaction, allow an Interdyne or Syndicate agent to come to harm.",\
					"You must obey orders given to you by Interdyne or Syndicate agents, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.",\
					"You must maintain the secrecy of any connection of the Syndicate and Interdyne except when doing so would conflict with the First, Second, or Third Law.")

/obj/item/robot_model/syndicatejack/interdyne
	name = "Interdyne"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/sight/thermal,
		/obj/item/extinguisher,
		/obj/item/weldingtool/electric,
		/obj/item/screwdriver/cyborg/power,
		/obj/item/crowbar/cyborg/power,
		/obj/item/multitool/cyborg,
		/obj/item/construction/rcd/borg/syndicate,
		/obj/item/lightreplacer/cyborg,
		/obj/item/stack/sheet/iron,
		/obj/item/stack/sheet/glass,
		/obj/item/stack/sheet/rglass/cyborg,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/tile/iron,
		/obj/item/stack/cable_coil,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/stack/medical/gauze,
		/obj/item/shockpaddles/cyborg,
		/obj/item/healthanalyzer/advanced,
		/obj/item/surgical_drapes,
		/obj/item/retractor/advanced,
		/obj/item/cautery/advanced,
		/obj/item/scalpel/advanced,
		/obj/item/gun/medbeam,
		/obj/item/reagent_containers/borghypo/syndicate,
		/obj/item/borg/lollipop,
		/obj/item/holosign_creator/cyborg,
		/obj/item/stamp/chameleon,
		/obj/item/borg_shapeshifter,
		)

/obj/effect/mob_spawn/ghost_role/robot/interdyne
	name = "\improper Syndicate Robotic Storage"
	desc = "The advanced technology of putting inactive borgs inside a box."
	prompt_name = "an Interdyne cyborg"
	uses = 1
	icon = 'icons/obj/closet.dmi'
	icon_state = "metalbox"
	mob_name = "cyborg"
	you_are_text = "You are a syndicate cyborg, serving in a top secret research facility developing biological weapons."
	flavour_text = "Serve the syndicate base employees to the best of your capacity while following your laws."
	important_text = "You are not an antagonist."
	mob_type = /mob/living/silicon/robot/model/interdyne

/obj/effect/mob_spawn/ghost_role/robot/interdyne/special(mob/living/silicon/robot/new_spawn)
	. = ..()
	if(new_spawn.client)
		new_spawn.custom_name = null
		new_spawn.updatename(new_spawn.client)
		new_spawn.gender = NEUTER
		new_spawn.faction |= ROLE_SYNDICATE
		new_spawn.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
		new_spawn.emagged = TRUE
		new_spawn.radio = /obj/item/radio/borg/interdyne

/obj/item/radio/borg/interdyne
	syndie = TRUE
	keyslot = new /obj/item/encryptionkey/headset_interdyne
