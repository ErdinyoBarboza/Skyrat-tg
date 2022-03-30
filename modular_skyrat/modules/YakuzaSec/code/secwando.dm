/datum/martial_art/secwando
	name = "Secwando"
	id = MARTIALART_SECWANDO
	var/disarmdamage = 0
	var/harmdamage = 0
	var/isLethal = FALSE
	var/isPremium = FALSE
	var/datum/action/cooldown/mob_cooldown/low_kick/lowkick = new/datum/action/cooldown/mob_cooldown/low_kick()
	var/datum/action/cooldown/mob_cooldown/spin_kick/spinkick = new/datum/action/cooldown/mob_cooldown/spin_kick()

/datum/action/cooldown/mob_cooldown/low_kick
	name = "Low Kick - Kick the victim in the shins, slowing them down for a moment."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"
	cooldown_time = 10 SECONDS

/datum/action/cooldown/mob_cooldown/spin_kick
	name = "Spin Kick - A risky finisher that has a chance to take-out already tired targets, however if they are not tired there is a chance to miss and fall."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "neckchop"
	cooldown_time = 30 SECONDS


/datum/action/cooldown/mob_cooldown/low_kick/Trigger(trigger_flags)
	if(owner.incapacitated())
		to_chat(owner, span_warning("You can't use [name] while you're incapacitated."))
		return
	if (owner.mind.martial_art.streak == "low_kick")
		owner.visible_message(span_danger("[owner] assumes a neutral stance."), "<b><i>Your next attack is cleared.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message(span_danger("[owner] assumes the Low Kick stance!"), "<b><i>Your next attack will be a Low Kick.</i></b>")
		owner.mind.martial_art.streak = "low_kick"

/datum/action/cooldown/mob_cooldown/spin_kick/Trigger(trigger_flags)
	if(owner.incapacitated())
		to_chat(owner, span_warning("You can't use [name] while you're incapacitated."))
		return
	if (owner.mind.martial_art.streak == "spin_kick")
		owner.visible_message(span_danger("[owner] assumes a neutral stance."), "<b><i>Your next attack is cleared.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message(span_danger("[owner] assumes the Spin Kick stance!"), "<b><i>Your next attack will be a Spin Kick.</i></b>")
		owner.mind.martial_art.streak = "spin_kick"

/datum/martial_art/secwando/teach(mob/living/owner, make_temporary=FALSE)
	if(..())
		to_chat(owner, span_userdanger("You know the arts of [name]!"))
		to_chat(owner, span_danger("Place your cursor over a move at the top of the screen to see what it does."))
		if(isPremium)
			spinkick.Grant(owner)
		lowkick.Grant(owner)

/datum/martial_art/secwando/on_remove(mob/living/owner)
	to_chat(owner, span_userdanger("You suddenly forget the arts of [name]..."))
	lowkick.Remove(owner)
	spinkick.Remove(owner)

/datum/martial_art/secwando/proc/check_streak(mob/living/attacker, mob/living/defender)
	switch(streak)
		if("spin_kick")
			streak = ""
			spin_kick(attacker, defender)
			return TRUE
		if("low_kick")
			streak = ""
			low_kick(attacker, defender)
			return TRUE
	return FALSE

/datum/martial_art/secwando/proc/low_kick(mob/living/attacker, mob/living/defender)
	if(defender.stat || defender.IsParalyzed())
		return FALSE
	var/obj/item/bodypart/affecting = defender.get_bodypart(BODY_ZONE_CHEST)
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	defender.visible_message(span_warning("[attacker] kicks [defender] in the shins!"), \
					span_userdanger("You are painfully kicked by [attacker] in the shins!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), null, attacker)
	to_chat(attacker, span_danger("You kick [defender] in the shins!"))
	playsound(get_turf(attacker), 'sound/effects/hit_kick.ogg', 50, TRUE, -1)
	defender.apply_damage(rand(10, 20), STAMINA, affecting, armor_block)
	if(!defender.has_movespeed_modifier(/datum/movespeed_modifier/shove))
		defender.add_movespeed_modifier(/datum/movespeed_modifier/shove)
		addtimer(CALLBACK(defender, /mob/living/carbon/proc/clear_shove_slowdown), SHOVE_SLOWDOWN_LENGTH * 2) // 6 Seconds of slow
	log_combat(attacker, defender, "Low Kicked")
	lowkick.StartCooldown()
	return TRUE

/datum/martial_art/secwando/proc/spin_kick(mob/living/attacker, mob/living/defender)
	var/obj/item/bodypart/affecting = defender.get_bodypart(ran_zone(attacker.zone_selected))
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	if(HAS_TRAIT(attacker, TRAIT_CLUMSY))
		attacker.SpinAnimation(7,1)
		attacker.StaminaKnockdown(80)
		attacker.Paralyze(2 SECONDS)
		attacker.visible_message(span_danger("[attacker] stumbles while trying to spin and falls down like a clown!"), \
							span_userdanger("You stumble trying to spin kick and fall!"))
	else if(prob(defender.getStaminaLoss()) && defender.stat < UNCONSCIOUS)
		var/atom/throw_target = get_edge_target_turf(defender, attacker.dir)
		var/obj/item/bodypart/headko = defender.get_bodypart(BODY_ZONE_HEAD)
		defender.visible_message(span_warning("[attacker] spins in the air and kicks [defender] on the jaw, knocking [defender.p_them()] out cold!"), \
				span_userdanger("Your jaw is kicked square by [attacker]! You are knocked out cold!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You spinkick [defender] on the jaw square, causing a knockout!"))
		playsound(get_turf(attacker), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		log_combat(attacker, defender, "spinkick KO")
		dance_rotate(attacker, CALLBACK(attacker, /mob.proc/dance_flip))
		headko.force_wound_upwards(/datum/wound/blunt/moderate)
		defender.StaminaKnockdown(100)
		defender.Paralyze(6 SECONDS)
		defender.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15, 150)
		addtimer(CALLBACK(defender, defender.throw_at(throw_target, 1, 5, attacker)), 20)
	else if(prob(80 - defender.getStaminaLoss()) && defender.stat < UNCONSCIOUS)
		defender.visible_message(span_warning("[attacker] spins in the air and tries to kick [defender] however [defender] dodges out of the way and [attacker] falls!"), \
				span_userdanger("You dodge the spinkick of [attacker] last second!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You try to spinkick [defender] but they dodge last second, causing you to fall down!"))
		playsound(get_turf(attacker), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		log_combat(attacker, defender, "spinkick FAIL")
		attacker.SpinAnimation(7,1)
		attacker.StaminaKnockdown(80)
		attacker.Paralyze(2 SECONDS)
	else
		defender.visible_message(span_warning("[attacker] spins in the air and kicks [defender]!"), \
				span_userdanger("You are suddenly kicked by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You spinkick [defender]!"))
		playsound(get_turf(attacker), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		log_combat(attacker, defender, "spinkick HIT")
		dance_rotate(attacker, CALLBACK(attacker, /mob.proc/dance_flip))
		defender.apply_damage(30, STAMINA, affecting, armor_block)
	spinkick.StartCooldown()
	return TRUE

/datum/martial_art/secwando/grab_act(mob/living/attacker, mob/living/defender)
	if(check_streak(attacker, defender))
		return TRUE
	log_combat(attacker, defender, "grabbed (Secwando)")
	..()

/datum/martial_art/secwando/harm_act(mob/living/attacker, mob/living/defender)
	if(check_streak(attacker, defender))
		return TRUE
	log_combat(attacker, defender, "punched")
	var/obj/item/bodypart/affecting = defender.get_bodypart(ran_zone(attacker.zone_selected))
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	var/picked_hit_type = pick("punch", "kick")
	var/bonus_damage = 0
	if(defender.body_position == LYING_DOWN)
		bonus_damage += 5
		picked_hit_type = "stomp"
	if(isLethal)
		defender.apply_damage(rand(0, 5) + bonus_damage + harmdamage, attacker.get_attack_type(), affecting, armor_block)
		defender.apply_damage(rand(10, 15) + bonus_damage + harmdamage, STAMINA, affecting, armor_block)
		to_chat(attacker, span_danger("You [picked_hit_type] [defender]!"))
		log_combat(attacker, defender, "[picked_hit_type] with [name]")
		defender.visible_message(span_danger("[attacker] [picked_hit_type]s [defender] brutally!"), \
					span_userdanger("You're [picked_hit_type]ed by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
	else
		defender.apply_damage(rand(10, 15) + bonus_damage + harmdamage, STAMINA, affecting, armor_block)
		to_chat(attacker, span_danger("You [picked_hit_type] [defender]!"))
		log_combat(attacker, defender, "[picked_hit_type] with [name] nonlethally")
		defender.visible_message(span_danger("[attacker] [picked_hit_type]s [defender]!"), \
					span_userdanger("You're [picked_hit_type]ed by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
	if(picked_hit_type == "kick" || picked_hit_type == "stomp")
		attacker.do_attack_animation(defender, ATTACK_EFFECT_KICK)
		playsound(get_turf(defender), 'sound/effects/hit_kick.ogg', 50, TRUE, -1)
	else
		attacker.do_attack_animation(defender, ATTACK_EFFECT_PUNCH)
		playsound(get_turf(defender), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
	return TRUE

/datum/martial_art/secwando/disarm_act(mob/living/attacker, mob/living/defender)
	if(check_streak(attacker, defender))
		return TRUE
	var/obj/item/bodypart/affecting = defender.get_bodypart(ran_zone(attacker.zone_selected))
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	if(defender.body_position == STANDING_UP)
		defender.visible_message(span_danger("[attacker] reprimands [defender]!"), \
					span_userdanger("You're palm slapped by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You palm slap [defender]!"))
		attacker.do_attack_animation(defender, ATTACK_EFFECT_DISARM)
		playsound(defender, 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		defender.apply_damage(rand(5, 10) + disarmdamage, STAMINA, affecting, armor_block)
		log_combat(attacker, defender, "punched nonlethally")
	if(defender.body_position == LYING_DOWN)
		defender.visible_message(span_danger("[attacker] reprimands [defender]!"), \
					span_userdanger("You're manhandled by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You stomp [defender]!"))
		attacker.do_attack_animation(defender, ATTACK_EFFECT_KICK)
		playsound(defender, 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		defender.apply_damage(rand(10, 15) + disarmdamage, STAMINA, affecting, armor_block)
		log_combat(attacker, defender, "stomped nonlethally")
	if(prob(defender.getStaminaLoss() * 0.5) && defender.stat < UNCONSCIOUS)
		defender.visible_message(span_warning("[defender] sputters and recoils in pain!"), span_userdanger("You drop whatever you are holding as you are winded out!"))
		defender.drop_all_held_items()
	return TRUE

//Secwando Gloves

/obj/item/clothing/gloves/secwando
	name = "secwando gloves"
	desc = "These gloves can teach you to perform Secwando using nanochips."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "secwando"
	var/datum/martial_art/secwando/style = new
	var/isBroken = FALSE
	var/glovedisarmdamage = 10
	var/gloveharmdamage = 10
	var/lethality = FALSE
	var/premium = FALSE
	var/currentuser
	resistance_flags = NONE
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT

/obj/item/clothing/gloves/secwando/equipped(mob/user, slot)
	. = ..()
	if(!isBroken && slot == ITEM_SLOT_GLOVES)
		style.isLethal = lethality
		style.isPremium = premium
		style.teach(user, TRUE)
		style.disarmdamage = glovedisarmdamage
		style.harmdamage = gloveharmdamage


/obj/item/clothing/gloves/secwando/dropped(mob/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_GLOVES) == src)
		style.remove(user)

/obj/item/clothing/gloves/secwando/proc/burntout(mob/user)
	style.remove(user)

/obj/item/clothing/gloves/secwando/proc/Fried(mob/living/wearer)
	wearer.StaminaKnockdown(80)
	wearer.Paralyze(2 SECONDS)
	to_chat(wearer, span_danger("Your [src] overload as your muscles contract involuntarily!"))

/obj/item/clothing/gloves/secwando/emp_act(severity)
	. = ..()
	var/mob/M = loc
	if(. & EMP_PROTECT_SELF)
		return
	if(!isBroken)
		isBroken = TRUE
		if(ismob(loc))
			to_chat(M,span_warning("[src]'s nanochips short out!"))
			burntout(M)
			if(severity >= EMP_HEAVY)
				Fried(M)

/obj/item/clothing/gloves/secwando/attackby(obj/item/I, mob/user, params)
	if((isBroken == TRUE) && istype(I, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/C = I
		to_chat(user,span_notice("You begin to repair the nanochips on [src] with [C]."))
		if(do_after(user, 2 SECONDS, src))
			C.use(1)
			isBroken = FALSE
			to_chat(user,span_notice("You repair the nanochips on [src] with [C]."))
		else to_chat(user,span_notice("You fail to repair the nanochips on [src]!"))

/obj/item/clothing/gloves/secwando/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	playsound(src, SFX_SPARKS, 100, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	obj_flags |= EMAGGED
	to_chat(user, span_notice("You override the safety restrictions of the nanochips!"))
	glovedisarmdamage += 5
	gloveharmdamage += 5
	lethality = TRUE
	desc += "The safety indicators on the nanochip seems to be broken!"


/obj/item/clothing/gloves/secwando/sec // Default Gloves given to security
	glovedisarmdamage = 5
	gloveharmdamage = 5
	lethality = TRUE

/obj/item/clothing/gloves/secwando/sec/premium
	premium = TRUE
	name = "premium secwando gloves"
	desc = "These gloves can teach you to perform Secwando using nanochips. \
			Premium nanochips allow the user to throw spinning kicks."

/obj/item/clothing/gloves/secwando/sec/lite
	lethality = FALSE
	name = "lite secwando gloves"
	desc = "These gloves can teach you to perform Secwando using nanochips. \
			Lite variant of the gloves prevent the user from doing direct lethal damage."

/obj/item/clothing/gloves/secwando/ghetto
