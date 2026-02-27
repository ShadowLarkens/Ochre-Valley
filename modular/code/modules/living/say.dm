/mob/proc/check_subtler(message, forced)
	//OV edit
	if(muffled && (copytext_char(message, 1, 2) == "*")) //muffled by belly but trying to emote
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
	//OV edit end
	if(copytext_char(message, 1, 2) == "@")
		if(message == "@")
			return
		emote("subtle", message = copytext_char(message, 2), intentional = !forced, custom_me = TRUE)
		return 1
