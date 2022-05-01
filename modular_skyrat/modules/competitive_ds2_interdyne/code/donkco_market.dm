/datum/market/blackmarket/donkco
	name = "Donk Co. Shipping Solutions"
	shipping = list(SHIPPING_METHOD_LTSRBT =50)

/obj/item/market_uplink/blackmarket/donkco
	name = "\improper Donk Co. Shipping Solutions Uplink"
	desc = "An uplink that connects to the Donk Co. Shipping Solutions shuttles to call in various supplies."
	accessible_markets = list(/datum/market/blackmarket/donkco)

/datum/market_item/donkco
	markets = list(/datum/market/blackmarket/donkco)
