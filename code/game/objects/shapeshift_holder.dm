#define DBG(msg) if(usr) to_chat(usr, "[time2text(world.timeofday, "hh:mm:ss")] [msg]")

/datum/soullink/shapeshift
	var/obj/shapeshift_holder/source

/datum/soullink/shapeshift/ownerDies(gibbed, mob/living/owner)
//	DBG("soullink ownerDies called | owner=[owner] gibbed=[gibbed]")
	if(source && !source.restoring)
//		DBG("soullink ownerDies forwarding to holder")
		source.casterDeath(gibbed)

/datum/soullink/shapeshift/sharerDies(gibbed, mob/living/sharer)
//	DBG("soullink sharerDies called | sharer=[sharer] gibbed=[gibbed]")
	if(source && !source.restoring)
//		DBG("soullink sharerDies forwarding to holder")
		source.shapeDeath(gibbed)



/obj/shapeshift_holder
	name = "Shapeshift holder"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ON_FIRE | UNACIDABLE | ACID_PROOF

	var/mob/living/stored
	var/mob/living/shape
	var/restoring = FALSE

	var/datum/soullink/shapeshift/slink
	var/obj/effect/proc_holder/spell/targeted/shapeshift/source



/obj/shapeshift_holder/proc/rebuild_perception(mob/living/M)
	if(!M)
//		DBG("[src]: rebuild_perception FAILED - M is null")
		return

	if(!M.client)
//		DBG("[src]: rebuild_perception skipped - no client on [M]")
		return

//	DBG("[src]: rebuild_perception for [M]")

	M.client.eye = M

	if(hascall(M, "reset_perspective"))
		M.reset_perspective(null)
//	else
//		DBG("[src]: WARNING - [M] missing reset_perspective()")

	if(hascall(M, "update_sight"))
		M.update_sight()
//	else
//		DBG("[src]: WARNING - [M] missing update_sight()")



/obj/shapeshift_holder/proc/hard_reset_spatial(mob/living/M)
//	DBG("hard_reset_spatial start | M=[M] loc=[M?.loc]")
	if(!M)
//		DBG("hard_reset_spatial abort: no mob")
		return

	var/atom/oldloc = M.loc
//	DBG("hard_reset_spatial oldloc=[oldloc]")

	M.moveToNullspace()
//	DBG("hard_reset_spatial moved to nullspace | loc=[M.loc]")

	if(oldloc)
		M.forceMove(oldloc)
//		DBG("hard_reset_spatial restored to oldloc | loc=[M.loc]")
//	else
//		DBG("hard_reset_spatial no oldloc to restore")



/obj/shapeshift_holder/Initialize(mapload, obj/effect/proc_holder/spell/targeted/shapeshift/source, mob/living/caster, mob/living/new_shape)
//	DBG("Initialize start | caster=[caster] shape=[new_shape]")
	. = ..()

	src.source = source
	stored = caster
	shape = new_shape

	if(!stored || !shape)
		DBG("Initialize failure: invalid mobs | stored=[stored] shape=[shape]")
		CRASH("shapeshift holder initialized without valid mobs")

	if(!isliving(shape))
		DBG("Initialize failure: shape not living | shape=[shape]")
		CRASH("shapeshift holder received non-living shape")

	if(stored.mind)
//		DBG("Initialize transferring mind [stored.mind] -> [shape]")
		stored.mind.transfer_to(shape)

	rebuild_perception(shape)
	hard_reset_spatial(shape)

//	DBG("Initialize moving stored into holder | stored.loc=[stored.loc] -> [src]")
	stored.forceMove(src)
	stored.notransform = TRUE

	if(source?.convert_damage)
		var/damage_percent = (stored.maxHealth - stored.health) / max(stored.maxHealth, 1)
		var/damapply = damage_percent * shape.maxHealth
//		DBG("Initialize damage convert | percent=[damage_percent] apply=[damapply]")
		shape.apply_damage(damapply, source.convert_damage_type, forced = TRUE)

	slink = soullink(/datum/soullink/shapeshift, stored, shape)
	if(slink)
//		DBG("Initialize soullink created")
		slink.source = src

//	DBG("Initialize end")



/obj/shapeshift_holder/Destroy()
//	DBG("Destroy start")
	restoring = TRUE

	if(slink)
//		DBG("Destroy deleting soullink")
		qdel(slink)
		slink = null

//	DBG("Destroy clearing refs")
	stored = null
	shape = null

	return ..()



/obj/shapeshift_holder/Moved()
	if(restoring || QDELETED(src))
		return
//	DBG("Holder Moved triggered | loc=[loc]")
	. = ..()
//	DBG("Moved calling restore()")
	restore()



/obj/shapeshift_holder/handle_atom_del(atom/A)
	if(restoring || QDELETED(src))
		return
//	DBG("handle_atom_del | A=[A] stored=[stored]")
	if(A == stored)
//		DBG("handle_atom_del triggering restore")
		restore()



/obj/shapeshift_holder/Exited(atom/movable/AM)
	if(restoring || QDELETED(src))
		return
//	DBG("Exited | AM=[AM] stored=[stored]")
	if(AM == stored)
//		DBG("Exited triggering restore")
		restore()



/obj/shapeshift_holder/proc/casterDeath(gibbed)
//	DBG("casterDeath | gibbed=[gibbed]")
	if(source?.revert_on_death)
//		DBG("casterDeath -> restore(death)")
		restore(death = TRUE)
	else if(shape)
//		DBG("casterDeath -> shape.death()")
		shape.death()



/obj/shapeshift_holder/proc/shapeDeath(gibbed)
//	DBG("shapeDeath | gibbed=[gibbed]")
	if(source?.die_with_shapeshifted_form)
		if(source?.revert_on_death)
//			DBG("shapeDeath -> restore(death)")
			restore(death = TRUE)
	else
//		DBG("shapeDeath -> restore(knockout=[source?.knockout_on_death])")
		restore(knockout = source?.knockout_on_death)



/obj/shapeshift_holder/proc/restore(death = FALSE, knockout = 0)
//	DBG("restore start | death=[death] knockout=[knockout] restoring=[restoring]")

	if(restoring || QDELETED(src))
//		DBG("restore abort early")
		return

	restoring = TRUE

	if(slink)
//		DBG("restore deleting soullink")
		qdel(slink)
		slink = null

	if(!stored)
//		DBG("restore failure: no stored mob")
		qdel(src)
		return

	var/mob/living/temp = stored
	stored = null

	var/turf/original_turf = get_turf(src)
//	DBG("restore original_turf=[original_turf]")

	if(original_turf)
//		DBG("restore forceMove temp -> turf")
		temp.forceMove(original_turf)
		hard_reset_spatial(temp)
	else
//		DBG("restore warning: no turf")

	temp.notransform = FALSE

	var/datum/mind/M = temp?.mind || shape?.mind
//	DBG("restore mind transfer | mind=[M]")
	if(M)
		M.transfer_to(temp)

	rebuild_perception(temp)

//	DBG("restore spawning tracks at [temp.loc]")
	var/obj/effect/track/the_evidence = new(temp.loc)
	the_evidence.handle_creation(temp)

	if(knockout)
//		DBG("restore applying knockout")
		temp.Unconscious(knockout, TRUE, TRUE)

	if(death)
//		DBG("restore killing stored")
		temp.death()
	else if(source?.convert_damage && shape)
//		DBG("restore converting damage back")
		temp.revive(full_heal = TRUE, admin_revive = FALSE)

		var/damage_percent = (shape.maxHealth - shape.health) / max(shape.maxHealth, 1)
		var/damapply = temp.maxHealth * damage_percent
//		DBG("restore damage percent=[damage_percent] apply=[damapply]")
		temp.apply_damage(damapply, source.convert_damage_type, forced = TRUE)

	if(shape)
//		DBG("restore deleting old shape [shape]")
		var/mob/living/old_shape = shape
		shape = null
		qdel(old_shape)

	stored = temp

//	DBG("restore deleting holder")
	qdel(src)
