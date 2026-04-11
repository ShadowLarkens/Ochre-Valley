/mob/proc/check_subtler(message, forced)
	//OV edit
	if(isitem(loc) && (copytext_char(message, 1, 2) == "@"))
		var/obj/item/the_item = loc
		if(the_item.mob_possession == src)
			message = copytext_char(message, 2)
			the_item.visible_message(span_italics("[the_item] [message]"), vision_distance = 1)
			log_talk(message, LOG_EMOTE)
			return 1
	if(muffled && (copytext_char(message, 1, 2) == "*")) //muffled by belly but trying to emote
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
	//OV edit end
	if(forced_psay || copytext_char(message, 1, 2) == "@") //Caustic Edit - Attempting to add Forced Psay using our subtle system
		if(message == "@" && !forced_psay) //Caustic Edit - Attempting to add Forced Psay using our subtle system
			return
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
