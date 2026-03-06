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

//OV edit
/mob/proc/check_portal_clothing(message, forced)
	message_admins("check portal clothing")
	if(copytext_char(message, 1, 2) == "-")
		message_admins("entered >")
		if(message == "-")
			message_admins("returned >")
			return
		if(!ishuman(src))
			message_admins("not human")
			return
		var/mob/living/carbon/human/the_human = src
		var/list/portal_clothing = list()
		for(var/obj/item/clothing/the_clothing in the_human.get_equipped_items())
			message_admins("clothing [the_clothing]")
			for(var/datum/component/portal_clothes/portal in the_clothing.GetComponents(/datum/component/portal_clothes))
				message_admins("found portal")
				portal_clothing += portal
		for(var/obj/item/undies/the_clothing in the_human.contents)
			message_admins("clothing [the_clothing]")
			for(var/datum/component/portal_clothes/portal in the_clothing.GetComponents(/datum/component/portal_clothes))
				message_admins("found portal")
				portal_clothing += portal
		if(!portal_clothing.len)
			message_admins("empty list")
			return
		if(portal_clothing.len == 1)
			for(var/datum/component/portal_clothes/portal in portal_clothing)
				portal.on_send(src, src, message)
		else
			var/datum/component/portal_clothes/which_portal = tgui_input_list(src, "Which portal are you responding to?", "Portal Clothing", portal_clothing)
			if(!which_portal)
				return
			which_portal.on_send(src, src, message)
		return 1
	message_admins("did not find >")
//OV edit end
