/mob/proc/check_subtler(message, forced)
	//OV edit
	if(muffled && (copytext_char(message, 1, 2) == "*")) //muffled by belly but trying to emote
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
	//OV edit end
	if(forced_psay || copytext_char(message, 1, 2) == "@") //Caustic Edit - Attempting to add Forced Psay using our subtle system
		if(message == "@" && !forced_psay) //Caustic Edit - Attempting to add Forced Psay using our subtle system
			return
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
