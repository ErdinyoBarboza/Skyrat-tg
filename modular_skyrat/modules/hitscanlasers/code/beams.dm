/obj/projectile/beam
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage = 17 // SKYRAT EDIT: 20
	damage_type = BURN
	hitsound = 'sound/weapons/sear.ogg'
	hitsound_wall = 'sound/weapons/effects/searwall.ogg'
	armor_flag = LASER
	eyeblur = 2
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	tracer_type = /obj/effect/projectile/tracer/hitscan/laser
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/laser
	impact_type = /obj/effect/projectile/impact/hitscan/laser
	light_system = MOVABLE_LIGHT
	hitscan_light_intensity = 2
	hitscan_light_range = 0.50
	hitscan_light_color_override = COLOR_SOFT_RED
	muzzle_flash_intensity = 4
	muzzle_flash_range = 1
	muzzle_flash_color_override = COLOR_SOFT_RED
	impact_light_intensity = 5
	impact_light_range = 1.25
	impact_light_color_override = COLOR_SOFT_RED
	ricochets_max = 50 //Honk!
	ricochet_chance = 80
	///Range of hitscan lasers
	range = 15
	reflectable = REFLECT_NORMAL
	wound_bonus = -20
	bare_wound_bonus = 10
	///Damage multiplier at ranges further then 3 tiles
	var/damage_constant = 0.8

/obj/projectile/beam/Range()
	if(hitscan != TRUE)
		return ..()
	var/turf/location = get_turf(src)
	if(!location)
		return ..()
	var/datum/gas_mixture/environment = location.return_air()
	var/environment_pressure = environment.return_pressure()
	if(environment_pressure >= 50)
		if((decayedRange - range) >= 4)
			damage *= damage_constant
	. = ..()

/obj/projectile/beam/laser
	wound_bonus = -30
	bare_wound_bonus = 40
	hitscan = TRUE

//overclocked laser, does a bit more damage but has much higher wound power (-0 vs -20)
/obj/projectile/beam/laser/hellfire
	name = "hellfire laser"
	hitscan_light_color_override = COLOR_DARK_RED
	muzzle_flash_color_override = COLOR_DARK_RED
	impact_light_color_override = COLOR_DARK_RED
	tracer_type = /obj/effect/projectile/tracer/hitscan/hellfire
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/hellfire
	impact_type = /obj/effect/projectile/impact/hitscan/hellfire
	wound_bonus = 0
	damage = 20
	hitscan = TRUE

/obj/projectile/beam/laser/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	damage = 30
	hitscan_light_color_override = LIGHT_COLOR_ORANGE
	muzzle_flash_color_override = LIGHT_COLOR_ORANGE
	impact_light_color_override = LIGHT_COLOR_ORANGE
	tracer_type = /obj/effect/projectile/tracer/hitscan/heavy_laser
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/heavy_laser
	impact_type = /obj/effect/projectile/impact/hitscan/heavy_laser
	hitscan = FALSE

/obj/projectile/beam/laser/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.ignite_mob()
	else if(isturf(target))
		impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser/wall

/obj/projectile/beam/weak
	damage = 10
	hitscan = TRUE

/obj/projectile/beam/weak/penetrator
	armour_penetration = 50

/obj/projectile/beam/practice
	name = "practice laser"
	damage = 0
	nodamage = TRUE
	hitscan = TRUE

/obj/projectile/beam/scatter
	name = "laser pellet"
	icon_state = "scatterlaser"
	damage = 5
	hitscan = TRUE

/obj/projectile/beam/xray
	name = "\improper X-ray beam"
	icon_state = "xray"
	damage = 15
	armour_penetration = 100
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF | PASSMACHINE | PASSSTRUCTURE | PASSDOORS
	hitscan = TRUE
	damage_constant = 0.9

	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	hitscan_light_color_override = LIGHT_COLOR_GREEN
	muzzle_flash_color_override = LIGHT_COLOR_GREEN
	impact_light_color_override = LIGHT_COLOR_GREEN
	tracer_type = /obj/effect/projectile/tracer/hitscan/xray
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/xray
	impact_type = /obj/effect/projectile/impact/hitscan/xray

/obj/projectile/beam/disabler
	name = "disabler beam"
	icon_state = "omnilaser"
	damage = 41 // SKYRAT EDIT: 30
	damage_type = STAMINA
	armor_flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	eyeblur = 0
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	hitscan_light_color_override = LIGHT_COLOR_BLUE
	muzzle_flash_color_override = LIGHT_COLOR_BLUE
	impact_light_color_override = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/hitscan/disabler
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/disabler
	impact_type = /obj/effect/projectile/impact/hitscan/disabler

/obj/projectile/beam/pulse
	name = "pulse"
	icon_state = "u_laser"
	damage = 50
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/pulse
	muzzle_type = /obj/effect/projectile/muzzle/pulse
	impact_type = /obj/effect/projectile/impact/pulse
	wound_bonus = 10

/obj/projectile/beam/pulse/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!QDELETED(target) && (isturf(target) || istype(target, /obj/structure/)))
		if(isobj(target))
			SSexplosions.med_mov_atom += target
		else
			SSexplosions.medturf += target

/obj/projectile/beam/pulse/shotgun
	damage = 30

/obj/projectile/beam/pulse/heavy
	name = "heavy pulse laser"
	icon_state = "pulse1_bl"
	projectile_piercing = ALL
	var/pierce_hits = 2

/obj/projectile/beam/pulse/heavy/on_hit(atom/target, blocked = FALSE)
	if(pierce_hits <= 0)
		projectile_piercing = NONE
	pierce_hits -= 1
	..()

/obj/projectile/beam/emitter
	name = "emitter beam"
	icon_state = "emitter"
	damage = 30
	range = 50
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser
	light_color = LIGHT_COLOR_GREEN
	wound_bonus = -40
	bare_wound_bonus = 70

/obj/projectile/beam/emitter/singularity_pull()
	return //don't want the emitters to miss

/obj/projectile/beam/emitter/hitscan
	hitscan = TRUE
	// muzzle_type = /obj/effect/projectile/muzzle/laser/emitter
	// tracer_type = /obj/effect/projectile/tracer/laser/emitter
	// impact_type = /obj/effect/projectile/impact/laser/emitter
	muzzle_type = /obj/effect/projectile/muzzle/hitscan/emitter
	tracer_type = /obj/effect/projectile/tracer/hitscan/emitter
	impact_type = /obj/effect/projectile/impact/hitscan/emitter
	impact_effect_type = null
	hitscan_light_intensity = 2
	hitscan_light_range = 0.75
	hitscan_light_color_override = COLOR_LIME
	muzzle_flash_intensity = 4
	muzzle_flash_range = 2
	muzzle_flash_color_override = COLOR_LIME
	impact_light_intensity = 5
	impact_light_range = 2.5
	impact_light_color_override = COLOR_LIME

/obj/projectile/beam/lasertag
	name = "laser tag beam"
	icon_state = "omnilaser"
	hitsound = null
	damage = 0
	damage_type = STAMINA
	var/suit_types = list(/obj/item/clothing/suit/redtag, /obj/item/clothing/suit/bluetag)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE

/obj/projectile/beam/lasertag/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(istype(M.wear_suit))
			if(M.wear_suit.type in suit_types)
				M.adjustStaminaLoss(34)

/obj/projectile/beam/lasertag/redtag
	icon_state = "laser"
	suit_types = list(/obj/item/clothing/suit/bluetag)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser
	light_color = COLOR_SOFT_RED
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser

/obj/projectile/beam/lasertag/redtag/hitscan
	hitscan = TRUE

/obj/projectile/beam/lasertag/bluetag
	icon_state = "bluelaser"
	suit_types = list(/obj/item/clothing/suit/redtag)
	tracer_type = /obj/effect/projectile/tracer/laser/blue
	muzzle_type = /obj/effect/projectile/muzzle/laser/blue
	impact_type = /obj/effect/projectile/impact/laser/blue

/obj/projectile/beam/lasertag/bluetag/hitscan
	hitscan = TRUE

//a shrink ray that shrinks stuff, which grows back after a short while.
/obj/projectile/beam/shrink
	name = "shrink ray"
	icon_state = "blue_laser"
	hitsound = 'sound/weapons/shrink_hit.ogg'
	damage = 0
	damage_type = STAMINA
	armor_flag = ENERGY
	impact_effect_type = /obj/effect/temp_visual/impact_effect/shrink
	light_color = LIGHT_COLOR_BLUE
	var/shrink_time = 90

/obj/projectile/beam/shrink/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isopenturf(target) || istype(target, /turf/closed/indestructible))//shrunk floors wouldnt do anything except look weird, i-walls shouldn't be bypassable
		return
	target.AddComponent(/datum/component/shrink, shrink_time)

