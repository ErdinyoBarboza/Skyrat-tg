/obj/item/melee/ebokken
	//icon = 'icons/obj/transforming_ebokken.dmi'
	name = "\improper CAT-AN4"
	desc = "Compliance Application Tool variant AN4 also known as a e-bokken, is a baton that is capable of inflicting non lethal damage when turned on and also can be used as a beating stick when off."
	icon = 'icons/obj/transforming_energy.dmi'
	icon_state = "e_sword"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 30)
	attack_verb_continuous = list("smacks", "strikes", "cracks", "beats")
	attack_verb_simple = list("smack", "strike", "crack", "beat")
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_BELT
	force = 12
	throwforce = 12
	wound_bonus = 15
	w_class = WEIGHT_CLASS_NORMAL
	damtype = BRUTE
	hitsound = SFX_SWING_HIT

	///Whether we have been broken by EMP
	var/broken = FALSE
	/// Whether our blade is active or not.
	var/blade_active = FALSE
	/// Force while active.
	var/active_force = 25
	/// Throwforce while active.
	var/active_throwforce = 35
	/// Sharpness while active.
	var/active_sharpness = 0
	/// Hitsound played attacking while active.
	var/active_hitsound = 'sound/effects/woodhit.ogg'
	/// Weight class while active.
	var/active_w_class = WEIGHT_CLASS_NORMAL
	/// The sound played when the item is turned on
	var/enable_sound = SFX_SPARKS
	/// The sound played when the item is turned off
	var/disable_sound = SFX_SPARKS


/obj/item/melee/ebokken/Initialize(mapload)
	. = ..()
	make_transformable()
	RegisterSignal(src, COMSIG_TRANSFORMING_PRE_TRANSFORM, .proc/brokenjitte)

/obj/item/melee/ebokken/Destroy()
	UnregisterSignal(src, COMSIG_TRANSFORMING_PRE_TRANSFORM)
	return ..()

/*
 * Gives our item the transforming component, passing in our various vars.
 */
/obj/item/melee/ebokken/proc/make_transformable()
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

/obj/item/melee/ebokken/add_blood_DNA(list/blood_dna)
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
/obj/item/melee/ebokken/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER

	blade_active = active
	if(active && (obj_flags & EMAGGED))
		damtype = BRUTE
	else if(active)
		damtype = STAMINA
	else
		damtype = BRUTE

	balloon_alert(user, "[name] [active ? "enabled":"disabled"]")
	playsound(user ? user : src, SFX_SPARKS, 35, TRUE)
	set_light_on(active)
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/melee/ebokken/emp_act(severity)
	. = ..()
	var/mob/M = loc
	if(!broken)
		burntout(M)
	if(blade_active)
		attack_self(src)
		broken = TRUE
	else
		broken = TRUE

/obj/item/melee/ebokken/proc/brokenjitte(datum/source, mob/user, active)
    SIGNAL_HANDLER

    if(broken)
        return COMPONENT_BLOCK_TRANSFORM

/obj/item/melee/ebokken/proc/burntout(mob/user)
	to_chat(user, span_danger("Your [src] overloads and shuts down!"))
	balloon_alert(user, "[name] broken!")
	desc += "It's electronics seem to be fried and can be repaired with <b>cable coil</b>."

/obj/item/melee/ebokken/attackby(obj/item/I, mob/user, params)
	if((broken == TRUE) && istype(I, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/C = I
		to_chat(user,span_notice("You begin to repair the electronics on [src] with [C]."))
		if(do_after(user, 5 SECONDS, src))
			C.use(1)
			broken = FALSE
			to_chat(user,span_notice("You repair the electronics on [src] with [C]."))
			desc = initial(desc)
			if(obj_flags & EMAGGED)
				desc += "The safety inhibitors have been overriden. Lethal mode is engaged!"
		else to_chat(user,span_notice("You fail to repair the electronics on [src]!"))

/obj/item/melee/ebokken/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	playsound(src, SFX_SPARKS, 100, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	obj_flags |= EMAGGED
	to_chat(user, span_notice("You override the safety restrictions of the [src]!"))
	//icon_state =
	if(blade_active)
		attack_self(src)
	desc += "The safety inhibitors have been overriden. Lethal mode is engaged!"
