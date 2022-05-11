/obj/machinery/vending/sustenance/syndie
	name = "\improper Whey Corp."
	desc = "A vending machine owned by the less known Whey Corp. that dispenses all the things an aspiring operative needs to become strong."
	product_slogans = "Enjoy your meal.;Enough calories to support a nuclear operative!;Pump those muscles!"
	product_ads = "Sufficiently healthy.;Efficiently produced tofu!;Mmm! So good!;Have a meal.;You need food to live!;Even prisoners deserve their daily bread!;Have some more candy corn!;Try our new ice cups!"
	light_mask = "snack-light-mask"
	icon_state = "sustenance"
	panel_type = "panel2"
	products = list(
		/obj/item/food/tofu/whey = 24,
		/obj/item/reagent_containers/food/drinks/protein_shake = 12,
	)
	contraband = list(
		/obj/item/food/syndicake = 6, //Cheat day
	)

	refill_canister = /obj/item/vending_refill/sustenance
	default_price = PAYCHECK_LOWER
	extra_price = PAYCHECK_LOWER * 0.6
	payment_department = NO_FREEBIES

/obj/item/food/tofu/whey
	name = "whey bar"
	desc = "Nutritious."
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8)
	tastes = list("powdered milk" = 1, "sour yoghurt" = 1)
	bite_consumption = 4
	foodtypes = DAIRY

/obj/item/reagent_containers/food/drinks/protein_shake
	name = "\improper Whey Corp. protein shake"
	desc = "A nutritious and power filled shake made to pump those muscles up. Now new with vanilla flavour!"
	icon_state = "ramen"
	list_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/growthserum = 5, /datum/reagent/consumable/vanilla = 3)
	foodtype = DAIRY
	isGlass = FALSE
	custom_price = PAYCHECK_LOWER * 0.9
	gulp_size = 9
	volume = 18
