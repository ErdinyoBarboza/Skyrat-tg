/datum/martial_art/secwando
	name = "Secwando"
	id = MARTIALART_SECWANDO
	var/disarmdamage
	var/harmdamage
	var/isLethal


/datum/martial_art/secwando/grab_act(mob/living/attacker, mob/living/defender)
	if(check_streak(attacker, defender))
		return TRUE
	log_combat(attacker, defender, "grabbed (Krav Maga)")
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
	if(!isLethal)
		defender.apply_damage(rand(0, 5) + bonus_damage + harmdamage, STAMINA, attacker.get_attack_type(), affecting, armor_block)
	else
		defender.apply_damage(rand(0, 5) + bonus_damage + harmdamage, attacker.get_attack_type(), affecting, armor_block)
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
		defender.apply_damage(rand(5, 10), STAMINA, affecting, armor_block)
		log_combat(attacker, defender, "punched nonlethally")
	if(defender.body_position == LYING_DOWN)
		defender.visible_message(span_danger("[attacker] reprimands [defender]!"), \
					span_userdanger("You're manhandled by [attacker]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, attacker)
		to_chat(attacker, span_danger("You stomp [defender]!"))
		attacker.do_attack_animation(defender, ATTACK_EFFECT_KICK)
		playsound(defender, 'sound/effects/hit_punch.ogg', 50, TRUE, -1)
		defender.apply_damage(rand(10, 15), STAMINA, affecting, armor_block)
		log_combat(attacker, defender, "stomped nonlethally")
	if(prob(defender.getStaminaLoss()) && defender.stat < UNCONSCIOUS)
		defender.visible_message(span_warning("[defender] sputters and recoils in pain!"), span_userdanger("You recoil in pain as you are jabbed in a nerve!"))
		defender.drop_all_held_items()
	return TRUE

//Secwando Gloves

/obj/item/clothing/gloves/secwando
	var/datum/martial_art/secwando/style = new

/obj/item/clothing/gloves/secwando/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_GLOVES)
		style.teach(user, TRUE)
		style.disarmdamage =


/obj/item/clothing/gloves/secwando/dropped(mob/user)
	. = ..()
	if(user.get_item_by_slot(ITEM_SLOT_GLOVES) == src)
		style.remove(user)

/obj/item/clothing/gloves/secwando/sec//more obviously named, given to sec
	name = "krav maga gloves"
	desc = "These gloves can teach you to perform Krav Maga using nanochips."
	icon_state = "fightgloves"
	inhand_icon_state = "fightgloves"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
