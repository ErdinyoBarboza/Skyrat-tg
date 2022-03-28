/datum/martial_art/secwando
	name = "Secwando"
	id = MARTIALART_SECWANDO
	var/disarmdamage = 0
	var/harmdamage = 0
	var/isLethal = FALSE
	var/isPremium = FALSE
	var/datum/action/cooldown/mob_cooldown/shin_kick/shinkick = new/datum/action/cooldown/mob_cooldown/shin_kick()
	var/datum/action/cooldown/mob_cooldown/spin_kick/spinkick = new/datum/action/cooldown/mob_cooldown/spin_kick()

/datum/action/cooldown/mob_cooldown/shin_kick
	name = "Shin Kick - Kick the victim in the shins, slowing them down for a moment."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"
	cooldown_time = 10 SECONDS

/datum/action/cooldown/mob_cooldown/spin_kick
	name = "Shin Kick - Kick the victim in the shins, slowing them down for a moment."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "neckchop"
	cooldown_time = 30 SECONDS


/datum/action/cooldown/mob_cooldown/shin_kick/Trigger(trigger_flags)
	if(owner.incapacitated())
		to_chat(owner, span_warning("You can't use [name] while you're incapacitated."))
		return
	if (owner.mind.martial_art.streak == "shin_kick")
		owner.visible_message(span_danger("[owner] assumes a neutral stance."), "<b><i>Your next attack is cleared.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message(span_danger("[owner] assumes the Shin Kick stance!"), "<b><i>Your next attack will be a Shin Kick.</i></b>")
		owner.mind.martial_art.streak = "shin_kick"

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
		shinkick.Grant(owner)

/datum/martial_art/secwando/on_remove(mob/living/owner)
	to_chat(owner, span_userdanger("You suddenly forget the arts of [name]..."))
	shinkick.Remove(owner)
	spinkick.Remove(owner)

/datum/martial_art/secwando/proc/check_streak(mob/living/attacker, mob/living/defender)
	switch(streak)
		if("spin_kick")
			streak = ""
			spin_kick(attacker, defender)
			return TRUE
		if("shin_kick")
			streak = ""
			shin_kick(attacker, defender)
			return TRUE
	return FALSE

/datum/martial_art/secwando/proc/shin_kick(mob/living/attacker, mob/living/defender)
	if(defender.stat || defender.IsParalyzed())
		return FALSE
	var/obj/item/bodypart/affecting = defender.get_bodypart(BODY_ZONE_CHEST)
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	defender.visible_message(span_warning("[attacker] kicks [defender] in the shins!"), \
					span_userdanger("Your shins are painfully kicked by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), null, attacker)
	to_chat(attacker, span_danger("You kick [defender] in the shins!"))
	playsound(get_turf(attacker), 'sound/effects/hit_kick.ogg', 50, TRUE, -1)
	defender.apply_damage(rand(10, 20), STAMINA, affecting, armor_block)
	if(!defender.has_movespeed_modifier(/datum/movespeed_modifier/shove))
		defender.add_movespeed_modifier(/datum/movespeed_modifier/shove) // maybe define a slightly more severe/longer slowdown for this
		addtimer(CALLBACK(defender, /mob/living/carbon/proc/clear_shove_slowdown), SHOVE_SLOWDOWN_LENGTH * 2)
	log_combat(attacker, defender, "shin kicked")
	shinkick.StartCooldown()
	return TRUE

/datum/martial_art/secwando/proc/spin_kick(mob/living/attacker, mob/living/defender)//is actually lung punch
	defender.visible_message(span_warning("[attacker] pounds [defender] on the chest!"), \
					span_userdanger("Your chest is slammed by [attacker]! You can't breathe!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
	to_chat(attacker, span_danger("You pound [defender] on the chest!"))
	playsound(get_turf(attacker), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
	if(defender.losebreath <= 10)
		defender.losebreath = clamp(defender.losebreath + 5, 0, 10)
	defender.adjustOxyLoss(10)
	log_combat(attacker, defender, "quickchoked")
	dance_rotate(attacker, CALLBACK(attacker, /mob.proc/dance_flip))
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
		defender.apply_damage(rand(5, 10) + bonus_damage + harmdamage, attacker.get_attack_type(), affecting, armor_block)
		to_chat(attacker, span_danger("LETHAL"))
	else
		defender.apply_damage(rand(5, 10) + bonus_damage + harmdamage, STAMINA, affecting, armor_block)
		to_chat(attacker, span_danger("NONLETHAL"))
	if(picked_hit_type == "kick" || picked_hit_type == "stomp")
		attacker.do_attack_animation(defender, ATTACK_EFFECT_KICK)
		playsound(get_turf(defender), 'sound/effects/hit_kick.ogg', 50, TRUE, -1)
	else
		attacker.do_attack_animation(defender, ATTACK_EFFECT_PUNCH)
		playsound(get_turf(defender), 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
	defender.visible_message(span_danger("[attacker] [picked_hit_type]s [defender]!"), \
					span_userdanger("You're [picked_hit_type]ed by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
	to_chat(attacker, span_danger("You [picked_hit_type] [defender]!"))
	log_combat(attacker, defender, "[picked_hit_type] with [name]")
	return TRUE

/datum/martial_art/secwando/disarm_act(mob/living/attacker, mob/living/defender)
	if(check_streak(attacker, defender))
		return TRUE
	var/obj/item/bodypart/affecting = defender.get_bodypart(ran_zone(attacker.zone_selected))
	var/armor_block = defender.run_armor_check(affecting, MELEE)
	if(defender.body_position == STANDING_UP)
		defender.visible_message(span_danger("[attacker] reprimands [defender]!"), \
					span_userdanger("You're slapped by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You jab [defender]!"))
		attacker.do_attack_animation(defender, ATTACK_EFFECT_PUNCH)
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
	if(prob(defender.getStaminaLoss()) && defender.stat < UNCONSCIOUS)
		defender.visible_message(span_warning("[defender] sputters and recoils in pain!"), span_userdanger("You recoil in pain as you are jabbed in a joint!"))
		defender.drop_all_held_items()
	return TRUE

//Secwando Gloves

/obj/item/clothing/gloves/secwando
	var/datum/martial_art/secwando/style = new
	var/glovedisarmdamage = 5
	var/gloveharmdamage = 5
	var/lethality = FALSE
	var/premium = FALSE

/obj/item/clothing/gloves/secwando/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_GLOVES)
		style.teach(user, TRUE)
		style.disarmdamage = glovedisarmdamage
		style.harmdamage = gloveharmdamage
		style.isLethal = lethality
		style.isPremium = premium

/obj/item/clothing/gloves/secwando/dropped(mob/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_GLOVES) == src)
		style.remove(user)

/obj/item/clothing/gloves/secwando/sec//more obviously named, given to sec
	name = "secwando gloves"
	desc = "These gloves can teach you to perform Krav Maga using nanochips."
	icon_state = "fightgloves"
	inhand_icon_state = "fightgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	glovedisarmdamage = 5
	gloveharmdamage = 5

/obj/item/clothing/gloves/secwando/sec/lethal
	glovedisarmdamage = 60
	lethality = TRUE
	premium = TRUE
