var/list/obj/effect/step_transporter/STEP_TELEPORTERS = list()
/* Simple object type, calls a proc when "stepped" on by something */

/obj/effect/step_transporter
	var/affect_ghosts = 1
	var/stopper = 1 // stops throwers
	var/mobs_only = FALSE
	invisibility = INVISIBILITY_ABSTRACT // nope cant see this shit
	anchored = TRUE
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.

/obj/effect/step_transporter/proc/Trigger(atom/movable/A)
	for(var/obj/effect/step_transporter/ST in STEP_TELEPORTERS)
		if(ST.id == src.id_target)
			A.loc = ST.loc	//Teleport to location with correct id.
			return
	return 0

/obj/effect/step_transporter/proc/on_entered(datum/source, H as mob|obj)
	SIGNAL_HANDLER
	if(!H)
		return
	if(isobserver(H) && !affect_ghosts)
		return
	if(!ismob(H) && mobs_only)
		return
	INVOKE_ASYNC(src, .proc/Trigger, H)


/obj/effect/step_transporter/New()
	..()
	STEP_TELEPORTERS += src

/obj/effect/step_transporter/Destroy()
	STEP_TELEPORTERS -= src
	return ..()
