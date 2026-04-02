/datum/virtue/utility/culinarian
	name = "Culinarian"
	added_traits = list(TRAIT_HOMESTEAD_EXPERT)
	desc = "Anyone can cook. You know that better than everybody. Why should you settle for the blandness of rations and other chaff when you can prepare the good stuff yourself? You may even fancy making a brew or two."
	added_stashed_items = list("Mess Kit" = /obj/item/storage/gadget/messkit)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
                        list(/datum/skill/craft/cooking, 2, 2),
						list(/datum/skill/labor/butchering, 2, 2))
