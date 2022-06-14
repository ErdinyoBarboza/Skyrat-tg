/obj/item/mecha_parts/mecha_equipment/solarbeamer
	name = "\improper Solar Beam Uplink"
	desc = "An exosuit-mounted targeting uplink that allows firing of solar beams from a remote satellite."
	icon_state = "mecha_rcd"
	equip_cooldown = 1000
	energy_drain = 250
	range = MECHA_MELEE|MECHA_RANGED
	item_flags = NO_MAT_REDEMPTION
	harmful = TRUE
	destroy_sound = 'sound/mecha/weapdestr.ogg'
	mech_flags = EXOSUIT_MODULE_COMBAT
	var/solar_beam_identifier = 0
	var/mob/living/beam_debuff_target

/obj/item/mecha_parts/mecha_equipment/solarbeamer/action(mob/source, mob/living/living_target, list/modifiers)
	if(isliving(living_target) && get_dist(chassis, living_target)<8)
		playsound(chassis, 'sound/machines/click.ogg', 50, TRUE)
		var/obj/effect/temp_visual/solarbeam_killsat/S = new (get_turf(src))
		var/matrix/starting = matrix()
		starting.Scale(1,32)
		starting.Translate(0,520)
		S.transform = starting
		var/obj/effect/temp_visual/solarbeam_killsat/K = new (get_turf(living_target))
		var/matrix/final = matrix()
		final.Scale(1,32)
		final.Translate(0,512)
		K.transform = final
		living_target.adjustFireLoss(30)
		living_target.adjust_fire_stacks(0.2)//Just here for the showmanship
		living_target.ignite_mob()
		playsound(living_target,'sound/weapons/sear.ogg', 50, TRUE)
		chassis.spark_system.start()
	return ..()


