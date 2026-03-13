//OV FILE
/mob/living/verb/ooc_escape()
	set name = "OOC Escape"
	set category = "OOC"

	if(isturf(src.loc))	//Doesn't work if you aren't contained in some way
		to_chat(src,span_warning("You are already on the ground. OOC Escape can not help you here."))
		return
	
	if(!loc)
		log_and_message_admins(span_warning("is trying to OOC escape, but they appear to be in nullspace, they probably need help."))
		return
	
	if(tgui_alert(src,"Are you sure? This should only be used in situations where you are OOC uncomfortable or otherwise unintentionally stuck.","OOC Escape",list("Cancel","Escape")) != "Escape")
		return

	var/atom/where = loc
	var/msg = "has OOC escaped. "
	forceMove(get_turf(src))
	if(isbelly(where))	//For vore
		if(pulledby)
			pulledby.stop_pulling()
		var/obj/belly/B = where
		msg += "They were in [key_name(B.owner)]'s [B]. "
	else if(istype(where,/obj/item/micro))	//For micros
		var/obj/item/micro/mh = where
		mh.dump_mob()
	else	//For everything else
		msg += "They were in [where]. "
	msg += "They have been placed on \the [loc]. [ADMIN_JMP(src)]"
	log_and_message_admins(msg)
