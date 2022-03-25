var/list/obj/effect/step_teleporter/STEP_TELEPORTERS = list()
/* Simple object type, calls a proc when "stepped" on by something */

/obj/effect/step_teleporter
	var/affect_ghosts = 1
	var/stopper = 1 // stops throwers
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.
	invisibility = 101 // nope cant see this shit
	anchored = 1

/obj/effect/step_teleporter/proc/Trigger(var/atom/movable/A)
	for(var/obj/effect/step_teleporter/ST in STEP_TELEPORTERS)
		if(ST.id == src.id_target)
			A.loc = ST.loc	//Teleport to location with correct id.
			return
	return 0

/obj/effect/step_teleporter/Crossed(H as mob|obj)
	..()
	if(!H)
		return
	if(isobserver(H) && !(isghost(H) && affect_ghosts))
		return
	Trigger(H)

/obj/effect/step_teleporter/New()
	..()
	STEP_TELEPORTERS += src

/obj/effect/step_teleporter/Destroy()
	STEP_TELEPORTERS -= src
	return ..()

//Testing stuff
/obj/effect/step_teleporter/underground_to_transition_1_A
	id = "underground_to_transition_1_A"
	id_target = "underground_to_transition_2_A"

/obj/effect/step_teleporter/underground_to_transition_2_A
	id = "underground_to_transition_2_A"
	id_target = "underground_to_transition_1_A"
