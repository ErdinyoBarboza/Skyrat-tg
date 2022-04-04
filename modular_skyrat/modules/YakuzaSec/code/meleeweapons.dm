/obj/item/melee/ejitte
	icon = 'icons/obj/transforming_ejitte.dmi'
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 30)
	attack_verb_continuous = list("smacks", "strikes", "cracks", "beats")
	attack_verb_simple = list("smack", "strike", "crack", "beat")
	resistance_flags = FIRE_PROOF
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_power = 1
	light_on = FALSE
	bare_wound_bonus = 20
	stealthy_audio = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	damtype = BRUTE


	/// The color of this ejitte based sword, for use in editing the icon_state.
	var/sword_color_icon
	/// Whether our blade is active or not.
	var/blade_active = FALSE
	/// Force while active.
	var/active_force = 8
	/// Throwforce while active.
	var/active_throwforce = 8
	/// Sharpness while active.
	var/active_sharpness = 0
	/// Hitsound played attacking while active.
	var/active_hitsound = 'sound/weapons/blade1.ogg'
	/// Weight class while active.
	var/active_w_class = WEIGHT_CLASS_NORMAL
	/// The heat given off when active.
	var/active_heat = 3500

	// SKYRAT EDIT ADD START

	/// The sound played when the item is turned on
	var/enable_sound = 'sound/weapons/saberon.ogg'

	/// The sound played when the item is turned off
	var/disable_sound = 'sound/weapons/saberoff.ogg'

	// SKYRAT EDIT ADD END

/obj/item/melee/ejitte/Initialize(mapload)
	. = ..()
	make_transformable()

/obj/item/melee/ejitte/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/*
 * Gives our item the transforming component, passing in our various vars.
 */
/obj/item/melee/ejitte/proc/make_transformable()
	AddComponent(/datum/component/transforming, \
		force_on = active_force, \
		throwforce_on = active_throwforce, \
		throw_speed_on = 4, \
		sharpness_on = active_sharpness, \
		hitsound_on = active_hitsound, \
		w_class_on = active_w_class, \
		attack_verb_continuous_on = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts"), \
		attack_verb_simple_on = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut"))
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, .proc/on_transform)

/obj/item/melee/ejitte/add_blood_DNA(list/blood_dna)
	return FALSE

/obj/item/melee/ejitte/process(delta_time)
	if(heat)
		open_flame()

/obj/item/melee/ejitte/ignition_effect(atom/atom, mob/user)
	if(!heat && !blade_active)
		return ""

	var/in_mouth = ""
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		if(carbon_user.wear_mask)
			in_mouth = ", barely missing [carbon_user.p_their()] nose"
	. = span_warning("[user] swings [user.p_their()] [name][in_mouth]. [user.p_they(TRUE)] light[user.p_s()] [user.p_their()] [atom.name] in the process.")
	playsound(loc, hitsound, get_clamped_volume(), TRUE, -1)
	add_fingerprint(user)

/*
 * Signal proc for [COMSIG_TRANSFORMING_ON_TRANSFORM].
 *
 * Updates our icon to have the correct color,
 * updates the amount of heat our item gives out,
 * enables / disables embedding, and
 * starts / stops processing.
 *
 * Also gives feedback to the user and activates or deactives the glow.
 */
/obj/item/melee/ejitte/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER

	blade_active = active
	if(active)
		heat = active_heat
		START_PROCESSING(SSobj, src)
		damtype = STAMINA
	else
		heat = initial(heat)
		STOP_PROCESSING(SSobj, src)
		damtype = BRUTE

	balloon_alert(user, "[name] [active ? "enabled":"disabled"]")
	playsound(user ? user : src, active ? 'sound/weapons/saberon.ogg' : 'sound/weapons/saberoff.ogg', 35, TRUE)
	set_light_on(active)
	return COMPONENT_NO_DEFAULT_MESSAGE
