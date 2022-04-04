/obj/item/food/voxbucket
	name = "\improper Vox Bucket"
	desc = "From the makers of Vox Box, here comes Vox Bucket. Its finger skrekking good!"
	icon_state = "cubancarp"
	bite_consumption = 3
	food_reagents = list(/datum/reagent/consumable/cooking_oil = 2, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("chicken" = 4, "fried batter" = 2, "skrek" = 1)
	junkiness = 25
	foodtypes = MEAT | FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL

/datum/crafting_recipe/food/voxbucket
	name = "Vox Bucket"
	reqs = list(
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/corn_starch = 5,
		/obj/item/food/meat/slab/human/mutant/chicken/vox = 1,
	)
	result = /obj/item/food/voxbucket
	subcategory = CAT_MEAT
