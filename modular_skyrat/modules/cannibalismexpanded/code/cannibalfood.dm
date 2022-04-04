/obj/item/food/voxbucket
	name = "\improper Vox Bucket"
	desc = "From the makers of Vox Box, here comes Vox Bucket. Its finger skrekking good!"
	icon = 'modular_skyrat/modules/cannibalismexpanded/icons/cannibalism.dmi'
	icon_state = "voxbucket"
	bite_consumption = 3
	food_reagents = list(/datum/reagent/consumable/cooking_oil = 2, /datum/reagent/consumable/nutriment/protein = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("chicken" = 4, "fried batter" = 2, "skrek" = 1)
	junkiness = 25
	foodtypes = MEAT | FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_LEGENDARY

/datum/crafting_recipe/food/voxbucket
	name = "Vox Bucket"
	reqs = list(
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/corn_starch = 5,
		/obj/item/food/meat/slab/human/mutant/chicken/vox = 1,
		/datum/reagent/consumable/milk = 5,
		/datum/reagent/consumable/salt = 5,
		/datum/reagent/consumable/blackpepper = 5,
		/obj/item/food/grown/chili = 1,
		/datum/reagent/consumable/astrotame = 5, // We add some MSG
	)
	result = /obj/item/food/voxbucket
	subcategory = CAT_MEAT

/obj/item/food/teshnuggs
	name = "\improper Teshari Nuggets"
	desc = "A box of baked premium nuggets made from boneless teshari meat. It makes you almost sad to eat it, almost!"
	icon = 'modular_skyrat/modules/cannibalismexpanded/icons/cannibalism.dmi'
	icon_state = "teshnuggs"
	bite_consumption = 3
	food_reagents = list(/datum/reagent/consumable/cooking_oil = 2, /datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/teshspice = 4)
	tastes = list("chicken" = 4, "cheesy and herby goodness" = 2, "nuggies" = 2, "skree" = 1)
	junkiness = 25
	foodtypes = MEAT | FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_LEGENDARY

/datum/crafting_recipe/food/teshnuggs
	name = "Teshari Nuggets"
	reqs = list(
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/corn_starch = 5,
		/obj/item/food/meat/slab/human/mutant/chicken/tesh = 1,
		/obj/item/food/firm_cheese_slice = 1,
		/datum/reagent/consumable/salt = 5,
		/datum/reagent/consumable/blackpepper = 5,
		/obj/item/food/grown/herbs = 1,
		/obj/item/food/butter = 1,
		/datum/reagent/consumable/astrotame = 2, // We add some MSG
	)
	result = /obj/item/food/voxbucket
	subcategory = CAT_MEAT
