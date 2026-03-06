//OV FILE
//CHANGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

/obj/item/portal_clothes
	name = "portal stone"
	icon = 'icons/roguetown/items/natural.dmi'
	icon_state = "stone1"
	desc = "A portal stone that can be synced to clothing, allowing sensations to be passed through it."
	var/datum/component/portal_clothes/paired_with
	possible_item_intents = list(/datum/intent/use)

/obj/item/portal_clothes/attack_self(mob/user)
	if(!paired_with)
		to_chat(user,"[src] is not currently paired with any clothing, use it on some clothing to pair it.")
		return
	if(!paired_with.clothing_holder)
		to_chat(user,"[src] is not currently paired with any clothing, use it on some clothing to pair it.")
		return
	if(!paired_with.current_holder)
		to_chat(user,"[paired_with.clothing_holder] is not currently equipped on anyone...")
		return
	var/input_text = input(user, "What sensations are you transmitting through the portal stone?", "Message")
	if(input_text)
		paired_with.on_receive(src, user, input_text)

/obj/item/portal_clothes/Destroy()
	if(paired_with)
		paired_with.Destroy()
	. = ..()

/obj/item/portal_clothes/pre_attack(atom/A, mob/living/user, params)
	if(isclothing(A) || istype(A, /obj/item/undies))
		if(!user.Adjacent(A))
			return
		var/obj/item/the_clothing = A
		var/confirming = tgui_alert(user, "Do you want to sync [src] with the [the_clothing]?", "Make portal", list("Yes", "No"))
		if(!confirming || (confirming == "No"))
			return
		if(paired_with)
			to_chat(user,"[paired_with.clothing_holder] is no longer synced to [src].")
			paired_with.Destroy()
		var/stuff = src
		the_clothing.AddComponent(/datum/component/portal_clothes, stuff)
		to_chat(user,"[the_clothing] is now synced to [src].")
	return TRUE

// THE DATUM!

/datum/component/portal_clothes
	var/obj/item/portal_clothes/portal_stone
	var/obj/item/clothing_holder
	var/mob/current_holder

/datum/component/portal_clothes/Initialize(var/portal_stone_register)
	if(!isclothing(parent) && !istype(parent, /obj/item/undies))
		return COMPONENT_INCOMPATIBLE
	clothing_holder = parent
	portal_stone = portal_stone_register
	portal_stone.paired_with = src
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_drop))

/datum/component/portal_clothes/proc/on_equip(datum/source, mob/user)
	current_holder = user

/datum/component/portal_clothes/proc/on_drop(datum/source, mob/user)
	current_holder = null

/datum/component/portal_clothes/proc/on_send(datum/source, mob/user, sending_message)
	if(!current_holder || !clothing_holder || !portal_stone)
		return
	
	var/turf/where_we_are = get_turf(portal_stone)
	for(var/mob/people in where_we_are.contents)
		to_chat(people, span_italics("[portal_stone] responds with a sensation from [current_holder]: [sending_message]"))
	

/datum/component/portal_clothes/proc/on_receive(datum/source, mob/user, receiving_message)
	if(!current_holder || !clothing_holder || !portal_stone)
		return
	
	to_chat(current_holder, span_italics("[clothing_holder] inflicts the following sensations on you: [receiving_message]"))

/datum/component/portal_clothes/Destroy(force, silent)
	. = ..()
	if(portal_stone)
		if(!QDELETED(portal_stone))
			portal_stone.paired_with = null

/datum/component/portal_clothes/proc/clear_link()
	if(portal_stone)
		if(!QDELETED(portal_stone))
			portal_stone.paired_with = null
	Destroy()
