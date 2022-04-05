/obj/item/melee/ejitte
	//icon = 'icons/obj/transforming_ejitte.dmi'
	name = "\improper CAT-AN4"
	desc = "Compliance Application Tool variant AN4 also known as a e-baton, is a baton that is capable of inflicting non lethal damage when turned on and also can be used as a beating stick when off."
	icon = 'icons/obj/transforming_energy.dmi'
	icon_state = "e_sword"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 30)
	attack_verb_continuous = list("smacks", "strikes", "cracks", "beats")
	attack_verb_simple = list("smack", "strike", "crack", "beat")
	resistance_flags = FIRE_PROOF
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_power = 1
	force = 12
	throwforce = 12
	light_on = FALSE
	bare_wound_bonus = 20
	w_class = WEIGHT_CLASS_NORMAL
	damtype = BRUTE

	///Whether we have been broken by EMP
	var/broken = FALSE


	/// Whether our blade is active or not.
	var/blade_active = FALSE
	/// Force while active.
	var/active_force = 8
	/// Throwforce while active.
	var/active_throwforce = 8
	/// Sharpness while active.
	var/active_sharpness = SHARP_EDGED
	/// Hitsound played attacking while active.
	var/active_hitsound = 'sound/effects/woodhit.ogg'
	/// Weight class while active.
	var/active_w_class = WEIGHT_CLASS_NORMAL

	/// The sound played when the item is turned on
	var/enable_sound = SFX_SPARKS

	/// The sound played when the item is turned off
	var/disable_sound = SFX_SPARKS

	// SKYRAT EDIT ADD END

/obj/item/melee/ejitte/Initialize(mapload)
	. = ..()
	make_transformable()
	RegisterSignal(src, COMSIG_TRANSFORMING_PRE_TRANSFORM, .proc/brokenjitte)

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
		attack_verb_continuous_on = list("stuns", "winds", "reprimands", "suppresses"), \
		attack_verb_simple_on = list("stun", "wind", "reprimand", "suppress"))
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, .proc/on_transform)

/obj/item/melee/ejitte/add_blood_DNA(list/blood_dna)
	if(blade_active)
		return FALSE

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
		damtype = STAMINA
		attack_verb_continuous = list("stuns", "winds", "reprimands", "suppresses")
		attack_verb_simple = list("stun", "wind", "reprimand", "suppress")
	else
		damtype = BRUTE
		attack_verb_continuous = list("smacks", "strikes", "cracks", "beats")
		attack_verb_simple = list("smack", "strike", "crack", "beat")

	balloon_alert(user, "[name] [active ? "enabled":"disabled"]")
	playsound(user ? user : src, SFX_SPARKS, 35, TRUE)
	set_light_on(active)
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/melee/ejitte/emp_act(severity)
	. = ..()
	var/mob/M = loc
	if(blade_active)
		attack_self(src)
		broken = TRUE
	else
		broken = TRUE
	burntout(M)

/obj/item/melee/ejitte/Destroy(forced)
    UnregisterSignal(src, COMSIG_TRANSFORMING_PRE_TRANSFORM)
    . = ..()

/obj/item/melee/ejitte/proc/brokenjitte(datum/source, mob/user, active)
    SIGNAL_HANDLER

    if(broken)
        return COMPONENT_BLOCK_TRANSFORM

/obj/item/melee/ejitte/proc/burntout(mob/user)
	to_chat(user, span_danger("Your [src] overloads and shuts down!"))
	balloon_alert(user, "[name] broken!")
