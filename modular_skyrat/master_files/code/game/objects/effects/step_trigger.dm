var/list/obj/effect/step_trigger/transition/STEP_TELEPORTERS = list()
/* Simple object type, calls a proc when "stepped" on by something */

/obj/effect/step_trigger/transition
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.

/obj/effect/step_trigger/transition/proc/Trigger(atom/movable/A)
	for(var/obj/effect/step_trigger/ST in STEP_TELEPORTERS)
		if(ST.id == src.id_target)
			A.loc = ST.loc	//Teleport to location with correct id.
			return
	return 0

/obj/effect/step_trigger/transition/Crossed(H as mob|obj)
	..()
	if(!H)
		return
	if(isobserver(H) && !(isghost(H) && affect_ghosts))
		return
	Trigger(H)

/obj/effect/step_trigger/transition/New()
	..()
	STEP_TELEPORTERS += src

/obj/effect/step_trigger/transition/Destroy()
	STEP_TELEPORTERS -= src
	return ..()
