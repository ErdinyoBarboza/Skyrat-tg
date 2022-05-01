/mob/living/simple_animal/hostile/retaliate/trader/donkco
	name = "Donk Co. Sales Unit"
	desc = "An automated sales export unit of Donk Co."
	maxHealth = 1000
	health = 1000
	verb_say = "states"
	verb_ask = "queries"
	verb_exclaim = "declares"
	verb_yell = "alarms"
	bubble_icon = "machine"
	speak_emote = list("states")
	speech_span = SPAN_TAPE_RECORDER
	sell_sound = 'sound/voice/hiss2.ogg'
	mob_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	products = list(
		/obj/item/market_uplink/blackmarket/donkco = 150,
	)
	wanted_items = list(
		/obj/item/reagent_containers/food/condiment/milk = 1000,
		/obj/item/stack/sheet/mineral/plasma = CARGO_CRATE_VALUE * 0.4
	)
	itemrejectphrase = "Sorry, I'm not a fan of anything you're showing me. Give me something better and we'll talk."
	itemsellcancelphrase = "Remember, we are always willing to buy more."
	itemsellacceptphrase = "Pleasure doing business with you."
	interestedphrase = "Donk Co. would like to buy that off from you."
	buyphrase = "Have a Donktastic day!"
	nocashphrase = "Failed to detect currency. Please ensure your holocredits are in-hand."
	icon_state = "mrbones"
	gender = PLURAL
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	loot = list(/obj/effect/decal/remains/robot)
	lore = list(
		"Have a Donktastic day!",
		"Feeling peckish? Have a Donk Pocket!",
		"EXTERMI-- EXCHANGE MONEY!",
		"Donk Pockets, now with 7 different flavors!",
		"Have you tried the new Ready to Eat Donks?"
	)
