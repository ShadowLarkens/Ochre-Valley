/datum/charflaw/hemovore
	name = "Hemovore"
	desc = "Be it by birth or curse, I can only gain sustenance through the blood of the living"

/datum/charflaw/hemovore/on_mob_creation(mob/user)
	ADD_TRAIT(user, TRAIT_LYFE_DRINK, TRAIT_GENERIC)
	ADD_TRAIT(user, TRAIT_VAMPBITE, TRAIT_GENERIC)
