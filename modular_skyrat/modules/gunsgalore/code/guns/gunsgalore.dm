/obj/item/gun/ballistic/automatic/akm
	name = "\improper AKM rifle"
	desc = "A timeless Russian infantry rifle chambered in an extremely outdated round. This is one of over two hundred million copies produced - in and outside of Sol. A tool for a revolution, an insurgency, justice, or crime. This rifle and its variants truly have no bounds."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "akm"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "akm"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/akm
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "akm"
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/akm_fire.ogg'
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magout.ogg'
	alt_icons = TRUE
	realistic = TRUE

/obj/item/ammo_box/magazine/akm
	name = "\improper AKM magazine"
	desc = "a banana-shaped double-stack magazine able to hold 30 rounds of 7.62x39mm Soviet ammunition. It's said that in the early days of SolFed's spread, Spanish colony rebels often referred to these as 'Goat Horns'."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "akm"
	ammo_type = /obj/item/ammo_casing/realistic/a762x39
	caliber = "a762x39"
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/akm/banana
	name = "\improper RPK magazine"
	desc = "a banana-shaped double-stack magazine able to hold 45 rounds of 7.62x39mm Soviet ammunition. It's meant to be used on a light machine gun, but it's just a longer AK magazine."
	max_ammo = 45

/obj/item/gun/ballistic/automatic/akm/modern
	name = "\improper tactical AKMS"
	desc = "a modernized version of the most iconic infantry rifle ever produced. This one has aftermarket parts and attachments, making it a better contender against its modern buddies. It still uses the same outdated rounds."
	icon_state = "akm_modern"
	inhand_icon_state = "akm"
	worn_icon_state = "akm"
	fire_delay = 1

/obj/item/gun/ballistic/automatic/fg42
	name = "\improper FG-42"
	desc = "A German paratrooper rifle designed to be used at long range chambered in 7.92x57mm. Most likely a reproduction of the original."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "fg42"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "fg42"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/fg42
	can_suppress = FALSE
	burst_size = 2
	spread = 0
	fire_delay = 2
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "fg42"
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/fg42_fire.ogg'
	alt_icons = TRUE
	realistic = TRUE
	zoomable = TRUE
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/batrifle_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/batrifle_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/batrifle_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/batrifle_magout.ogg'
	eject_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/batrifle_magout.ogg'

/obj/item/ammo_box/magazine/fg42
	name = "fg42 magazine (7.92x57mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "fg42"
	ammo_type = /obj/item/ammo_casing/realistic/a792x57
	caliber = "a792x57"
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/pistol/luger
	name = "\improper Armadyne P-09X"
	desc = "A small, light-weight reproduction of the Luger P08 from the 20th century, manufactured by the Oldarms division of the Armadyne Corporation. Chambered in 9mm."
	icon_state = "luger"
	inhand_icon_state = "luger"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns.dmi'
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_fire.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_mag_insert.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_mag_insert.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_mag_release.ogg'
	eject_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_mag_release.ogg'
	rack_sound =  'modular_skyrat/modules/gunsgalore/sound/guns/fire/luger_rack.ogg'
	fire_sound_volume = 100
	suppressor_x_offset = 14

/obj/item/gun/ballistic/automatic/m16
	name = "\improper M16A4 rifle"
	desc = "The fourth iteration of the M16 series of infantry rifles, firing the extremely old (yet strangely stil in use) 5.56x45mm cartridge. This seems to be a reproduction, as the model was phased out in the early 2030's to accomodate for more modern designs."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "m16"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "m16"
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "m16"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/m16
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 2
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/m16_fire.ogg'
	fire_sound_volume = 50
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/sfrifle_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/sfrifle_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/sfrifle_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/sfrifle_magout.ogg'
	alt_icons = TRUE
	realistic = TRUE

/obj/item/ammo_box/magazine/m16
	name = "m16 magazine (5.56x45mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "m16"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = "a556"
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/m16/modern
	name = "\improper AR-25T"
	desc = "An M16 pattern infantry rifle, this one is a modern sporting/self defense model filled to the brim with aftermarket parts. Come and take it."
	icon_state = "m16_modern"
	inhand_icon_state = "m16"
	worn_icon_state = "m16"
	spread = 0.5
	burst_size = 3
	fire_delay = 1.90

/obj/item/gun/ballistic/automatic/m16/modern/v2
	name = "\improper AR-24 'Patriot'"
	desc = "An M16 pattern infantry rifle with a short barrel and modified cycling mechanism that allows it to fire it significantly faster, with no care for accuracy or effectiveness. There's only room for one snake and one boss."
	icon_state = "m16_modern2"
	inhand_icon_state = "m16"
	worn_icon_state = "m16"
	burst_size = 4
	fire_delay = 1

/obj/item/gun/ballistic/automatic/mg34
	name = "\improper MG-34"
	desc = "A reproduction of the German MG-34 general purpose machine gun, this one is a revision from the 2200's and was one of several thousand distributed to SolFed expedition teams. It has been rechambered to fire 7.92mm Mauser instead of 7.62mm NATO."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	icon_state = "mg34"
	base_icon_state = "mg34"
	worn_icon_state = "mg34"
	inhand_icon_state = "mg34"
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/mg34_fire.ogg'
	rack_sound = 'sound/weapons/gun/l6/l6_rack.ogg'
	suppressed_sound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	fire_sound_volume = 70
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_FULLY_AUTOMATIC)
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	spread = 15
	mag_type = /obj/item/ammo_box/magazine/mg34
	can_suppress = FALSE
	fire_delay = 1
	realistic = TRUE
	dirt_modifier = 0.1
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	tac_reloads = FALSE
	var/cover_open = FALSE

/obj/item/gun/ballistic/automatic/mg34/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/gun/ballistic/automatic/mg34/examine(mob/user)
	. = ..()
	. += "<b>RMB with an empty hand</b> to [cover_open ? "close" : "open"] the dust cover."
	if(cover_open && magazine)
		. += span_notice("It seems like you could use an <b>empty hand</b> to remove the magazine.")

/obj/item/gun/ballistic/automatic/mg34/attack_hand_secondary(mob/user, list/modifiers)
	if(!user.canUseTopic(src))
		return
	cover_open = !cover_open
	to_chat(user, span_notice("You [cover_open ? "open" : "close"] [src]'s cover."))
	playsound(src, 'sound/weapons/gun/l6/l6_door.ogg', 60, TRUE)
	update_appearance()
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/gun/ballistic/automatic/mg34/update_overlays()
	. = ..()
	. += "[base_icon_state]_door_[cover_open ? "open" : "closed"]"

/obj/item/gun/ballistic/automatic/mg34/can_shoot()
	if(cover_open)
		balloon_alert_to_viewers("cover open!")
		return FALSE
	return chambered

/obj/item/gun/ballistic/automatic/mg34/eject_magazine(mob/user, display_message = TRUE, obj/item/ammo_box/magazine/tac_load = null)
	if(!cover_open)
		to_chat(user, span_warning("The cover is closed! Open it before ejecting the magazine!"))
		return
	return ..()

/obj/item/gun/ballistic/automatic/mg34/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, span_warning("[src]'s dust cover prevents a magazine from being fit."))
		return
	..()

/obj/item/ammo_box/magazine/mg34
	name = "mg34 drum (7.92x57mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "mg34_drum"
	ammo_type = /obj/item/ammo_casing/realistic/a792x57
	caliber = "a792x57"
	max_ammo = 75
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/mg34/packapunch //INFINITY GUNNNNNNNN
	name = "\improper MG-34 UBER"
	desc = "Here, there, seems like everywhere. Nasty things are happening, now everyone is scared. Old Jeb Brown the Blacksmith, he saw his mother die. A critter took a bite from her and now she's in the sky. "
	fire_delay = 0.04
	burst_size = 5
	spread = 5
	dirt_modifier = 0
	durability = 500
	mag_type = /obj/item/ammo_box/magazine/mg34/packapunch

/obj/item/ammo_box/magazine/mg34/packapunch
	max_ammo = 999
	multiple_sprites = AMMO_BOX_ONE_SPRITE

/obj/item/gun/ballistic/automatic/mg34/packapunch/process_chamber(empty_chamber, from_firing, chamber_next_round)
	. = ..()
	magazine.top_off()

/// BIGGER BROTHER
#define SPREAD_UNDEPLOYED 17
#define SPREAD_DEPLOYED 6
#define HEAT_PER_SHOT 1.5
#define TIME_TO_COOLDOWN 20 SECONDS
#define BARREL_COOLDOWN_RATE 2

/obj/item/gun/ballistic/automatic/mg34/mg42
	name = "\improper Armadyne MG-9V GPMG"
	desc = "An updated version of the German Maschinengewehr 42 machine gun chambered in 7.92 Mauser, it has a bipod for better stability when deployed. It is a reproduction manufactured by the Oldarms division of the Armadyne Corporation."
	icon_state = "mg42"
	base_icon_state = "mg42"
	worn_icon_state = "mg42"
	inhand_icon_state = "mg42"
	fire_sound_volume = 100
	fire_delay = 0.5
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/mg42_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/mg42
	spread = SPREAD_UNDEPLOYED
	/// If we are resting, the bipod is deployed.
	var/bipod_deployed = FALSE
	/// How hot the barrel is, 0 - 100
	var/barrel_heat = 0
	/// Have we overheated?
	var/overheated = FALSE

/obj/item/gun/ballistic/automatic/mg34/mg42/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_GUN_FIRED, .proc/process_heat)
	START_PROCESSING(SSobj, src)

/obj/item/gun/ballistic/automatic/mg34/mg42/process(delta_time)
	if(barrel_heat > 0)
		barrel_heat -= BARREL_COOLDOWN_RATE * delta_time
		update_appearance()

/obj/item/gun/ballistic/automatic/mg34/mg42/examine(mob/user)
	. = ..()
	switch(barrel_heat)
		if(50 to 75)
			. += span_warning("The barrel looks hot.")
		if(75 to INFINITY)
			. += span_warning("The barrel looks moulten!")
	if(overheated)
		. += span_danger("It is heatlocked!")

/obj/item/gun/ballistic/automatic/mg34/mg42/can_shoot()
	if(cover_open)
		balloon_alert_to_viewers("cover open!")
		return FALSE
	if(overheated)
		balloon_alert_to_viewers("overheated!")
		shoot_with_empty_chamber()
		return FALSE
	return chambered

/obj/item/gun/ballistic/automatic/mg34/mg42/pickup(mob/user)
	. = ..()
	RegisterSignal(user, COMSIG_LIVING_UPDATED_RESTING, .proc/deploy_bipod)

/obj/item/gun/ballistic/automatic/mg34/mg42/dropped(mob/user)
	. = ..()
	UnregisterSignal(user, COMSIG_LIVING_UPDATED_RESTING)
	bipod_deployed = FALSE
	base_spread = SPREAD_UNDEPLOYED
	update_appearance()

/obj/item/gun/ballistic/automatic/mg34/mg42/proc/deploy_bipod(datum/datum_source, resting)
	SIGNAL_HANDLER
	if(resting)
		bipod_deployed = TRUE
		base_spread = SPREAD_DEPLOYED
	else
		bipod_deployed = FALSE
		base_spread = SPREAD_UNDEPLOYED
	playsound(src, 'modular_skyrat/modules/gunsgalore/sound/guns/fire/mg42_bipod.ogg', 100)
	balloon_alert_to_viewers("bipod [bipod_deployed ? "deployed" : "undeployed"]!")
	update_appearance()

/obj/item/gun/ballistic/automatic/mg34/mg42/proc/process_heat()
	SIGNAL_HANDLER
	if(overheated)
		return
	barrel_heat += HEAT_PER_SHOT
	if(barrel_heat >= 100)
		overheated = TRUE
		playsound(src, 'modular_skyrat/modules/gunsgalore/sound/guns/fire/mg_overheat.ogg', 100)
		addtimer(CALLBACK(src, .proc/reset_overheat), TIME_TO_COOLDOWN)
	update_appearance()

/obj/item/gun/ballistic/automatic/mg34/mg42/proc/reset_overheat()
	overheated = FALSE
	update_appearance()

/obj/item/gun/ballistic/automatic/mg34/mg42/update_overlays()
	. = ..()
	. += "[base_icon_state]_[bipod_deployed ? "bipod_deployed" : "bipod"]"

	switch(barrel_heat)
		if(50 to 75)
			. += "[base_icon_state]_barrel_hot"
		if(75 to INFINITY)
			. += "[base_icon_state]_barrel_overheat"

#undef SPREAD_UNDEPLOYED
#undef SPREAD_DEPLOYED
#undef HEAT_PER_SHOT
#undef TIME_TO_COOLDOWN
#undef BARREL_COOLDOWN_RATE

/obj/item/ammo_box/magazine/mg42
	name = "mg42 drum (7.92x57mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "mg42_drum"
	ammo_type = /obj/item/ammo_casing/realistic/a792x57
	caliber = "a792x57"
	max_ammo = 250 // It's a lot, but the gun overheats.
	multiple_sprites = AMMO_BOX_FULL_EMPTY_BASIC

/obj/item/gun/ballistic/automatic/mp40
	name = "\improper MP-40"
	desc = "The instantly recognizable 'kraut gun'. Extremely outdated SMG that has only seen service during Sol-3's second World War. This one's a poor, unlicensed reproduction."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "mp40"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "mp40"
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "mp40"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/mp40
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1.7
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/mp40_fire.ogg'
	fire_sound_volume = 100
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magout.ogg'
	alt_icons = TRUE
	realistic = TRUE

/obj/item/ammo_box/magazine/mp40
	name = "mp40 magazine (9mmx19)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "mp40"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "c9mm"
	max_ammo = 32
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/mp40/modern
	name = "\improper MP-40k"
	desc = "An extremely outdated German SMG that has been modified extensively with aftermarket parts. It looks like it came straight out of the videogame Return to Fortress Dogenstein."
	icon_state = "mp40_modern"
	inhand_icon_state = "mp40"
	worn_icon_state = "mp40"
	burst_size = 4
	fire_delay = 1.5

/obj/item/gun/ballistic/automatic/pps
	name = "\improper PPS-43"
	desc = "A very cheap, barely reliable reproduction of a personal defense weapon based on the original Soviet model. Not nearly as infamous as the Mosin."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "pps"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "pps"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/pps
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 3
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "pps"
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/pps_fire.ogg'
	fire_sound_volume = 100
	alt_icons = TRUE
	realistic = TRUE
	durability_factor = 0.5
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magout.ogg'

/obj/item/ammo_box/magazine/pps
	name = "pps magazine (7.62x25mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "pps"
	ammo_type = /obj/item/ammo_casing/realistic/a762x25
	caliber = "a762x25"
	max_ammo = 35
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/ppsh
	name = "\improper PPSh-41"
	desc = "A reproduction of a simple Soviet SMG chambered in 7.62x25 Tokarev rounds. Its heavy wooden stock and leather breech buffer help absorb the bolt’s heavy recoil, making it great for spraying and praying. Uraaaa!"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "ppsh"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "ppsh"
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "ppsh"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/ppsh
	can_suppress = FALSE
	spread = 20
	burst_size = 6
	fire_delay = 0.5
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/ppsh_fire.ogg'
	fire_sound_volume = 80
	alt_icons = TRUE
	realistic = TRUE
	dirt_modifier = 0.3
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/smg_magout.ogg'

/obj/item/ammo_box/magazine/ppsh
	name = "ppsh-41 magazine (7.62x25mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "ppsh"
	ammo_type = /obj/item/ammo_casing/realistic/a762x25
	caliber = "a762x25"
	max_ammo = 71
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/gun/ballistic/automatic/ppsh/modern
	name = "\improper PPsh-59"
	desc = "A modernized reproduction of a simple Soviet SMG with aftermarket parts. Its heavy synthetic stock and composite breech buffer help absorb the bolt’s heavy recoil, a mix of two worlds that should not exist."
	icon_state = "ppsh_modern"
	worn_icon_state = "ppsh"
	inhand_icon_state = "ppsh"
	spread = 15
	burst_size = 5

/obj/item/gun/ballistic/automatic/stg
	name = "\improper Armadyne StG-45"
	desc = "A reproduction of the Sturmgewehr 44 German infantry rifle chambered in 7.92mm, manufactured by the Oldarms division of the Armadyne Corporation."
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_guns40x32.dmi'
	icon_state = "stg"
	lefthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_righthand.dmi'
	inhand_icon_state = "stg"
	worn_icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_back.dmi'
	worn_icon_state = "stg"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/stg
	can_suppress = FALSE
	burst_size = 4
	fire_delay = 1.5
	fire_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/fire/stg_fire.ogg'
	fire_sound_volume = 70
	alt_icons = TRUE
	realistic = TRUE
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC, SELECT_BURST_SHOT, SELECT_FULLY_AUTOMATIC)
	rack_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_cock.ogg'
	load_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magin.ogg'
	eject_sound = 'modular_skyrat/modules/gunsgalore/sound/guns/interact/ltrifle_magout.ogg'

/obj/item/ammo_box/magazine/stg
	name = "stg magazine (7.92x33mm)"
	icon = 'modular_skyrat/modules/gunsgalore/icons/guns/gunsgalore_items.dmi'
	icon_state = "stg"
	ammo_type = /obj/item/ammo_casing/realistic/a792x33
	caliber = "a792x33"
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

