//Special items only available via donkco market for DS2/Interdyne

/obj/vehicle/ridden/atv/turret/donkco

/obj/vehicle/ridden/atv/turret/donkco/Initialize(mapload)
	. = ..()
	turret.lethal_projectile = /obj/projectile/bullet/syndicate_turret
