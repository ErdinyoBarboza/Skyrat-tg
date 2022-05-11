/datum/market/blackmarket/donkco
	name = "Donk Co. Shipping Solutions"
	shipping = list(SHIPPING_METHOD_LTSRBT =50)

/obj/item/market_uplink/blackmarket/donkco
	name = "\improper Donk Co. Shipping Solutions Uplink"
	desc = "An uplink that connects to the Donk Co. Shipping Solutions shuttles to call in various supplies."
	accessible_markets = list(/datum/market/blackmarket/donkco)

/datum/market_item/donkco
	markets = list(/datum/market/blackmarket/donkco)

/datum/market_item/donkco/consumable
	category = "Consumables"

/datum/market_item/donkco/consumable/pumpup
	name = "Maintenance Pump-Up"
	desc = "Resist any Baton stun with this handy device!"
	item = /obj/item/reagent_containers/hypospray/medipen/pumpup

	stock_max = 3
	price_min = CARGO_CRATE_VALUE * 0.25
	price_max = CARGO_CRATE_VALUE * 0.75
	availability_prob = 100
