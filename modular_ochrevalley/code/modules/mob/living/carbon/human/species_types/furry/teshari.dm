/mob/living/carbon/human/species/teshari
	race = /datum/species/teshari

/datum/species/teshari
	name = "Teshari"
	id = "teshari"
	is_subrace = TRUE
	origin_default = /datum/virtue/origin/unknown
	origin = "Unknown"
	base_name = "Beastvolk"
	desc = "<b>Teshari</b><br>\
	Bird..."
	species_traits = list(EYECOLOR,LIPS,STUBBLE,MUTCOLORS)
	allowed_taur_types = list(
		/obj/item/bodypart/taur/lamia,
		/obj/item/bodypart/taur/lizard,
		/obj/item/bodypart/taur/drake,
		/obj/item/bodypart/taur/altnaga,
		/obj/item/bodypart/taur/altnagatailmaw,
		/obj/item/bodypart/taur/fatnaga,
	)
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'modular_ochrevalley/icons/mob/species/teshari.dmi'
	limbs_icon_f = 'modular_ochrevalley/icons/mob/species/teshari.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	use_f = TRUE
	custom_clothes = TRUE
	clothes_id = "dwarf"
	offset_features = list(
		OFFSET_ID = list(0,-5), OFFSET_GLOVES = list(0,-3), OFFSET_WRISTS = list(0,-3),\
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-4), OFFSET_HEAD = list(0,0), \
		OFFSET_FACE = list(0,0), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-3), \
		OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), \
		OFFSET_ID_F = list(0,-5), OFFSET_GLOVES_F = list(0,-4), OFFSET_WRISTS_F = list(0,-4), OFFSET_HANDS_F = list(0,-4), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-5), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,-4), OFFSET_BACK_F = list(0,-4), OFFSET_BUTT = list(0,-4), \
		OFFSET_NECK_F = list(0,-5), OFFSET_MOUTH_F = list(0,-5), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES = list(0,-4), OFFSET_UNDIES_F = list(0,-4), \
		OFFSET_TAUR = list(-16,0), OFFSET_TAUR_F = list(-16,0), \
		)

	enflamed_icon = "widefire"
	attack_verb = "slash"
	attack_sound = 'sound/blank.ogg'
	miss_sound = 'sound/blank.ogg'
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		// ORGAN_SLOT_WINGS = /obj/item/organ/wings/moth,
		)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid/bald_default,
		/datum/customizer/bodypart_feature/hair/facial/humanoid/shaved_default,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/bodypart_feature/legwear,
		/datum/customizer/bodypart_feature/piercing,
		/datum/customizer/organ/horns/humanoid,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/vagina/animal,
		/datum/customizer/organ/tail/anthro,
		/datum/customizer/organ/tail_feature/anthro,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal,
		/datum/customizer/organ/ears/teshari,
		)
	body_markings = list(
		/datum/body_marking/small/plain,
		/datum/body_marking/small/sock,
		/datum/body_marking/small/socklonger,
		/datum/body_marking/small/tips,
		/datum/body_marking/small/belly,
		/datum/body_marking/small/bellyslim,
		/datum/body_marking/small/butt,
		/datum/body_marking/small/tie,
		/datum/body_marking/small/tiesmall,
		/datum/body_marking/small/backspots,
		/datum/body_marking/small/front,
		/datum/body_marking/small/spotted,
		/datum/body_marking/small/nose,
		/datum/body_marking/small/bangs,
		/datum/body_marking/small/bun,
	)
	languages = list(
		/datum/language/common,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/trait,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one_wild,
		/datum/descriptor_choice/prominent_two_wild,
		/datum/descriptor_choice/prominent_three_wild,
		/datum/descriptor_choice/prominent_four_wild,
	)

/datum/species/teshari/check_roundstart_eligible()
	return TRUE

/datum/species/teshari/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/teshari/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/teshari/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/teshari/get_random_features()
	var/list/returned = MANDATORY_FEATURE_LIST
	var/main_color
	var/second_color
	var/random = rand(1,1)
	switch(random)
		if(1)
			main_color = "edcf7e"
			second_color = "2b2a24"
	returned["mcolor"] = main_color
	returned["mcolor2"] = second_color
	returned["mcolor3"] = second_color
	return returned

/datum/customizer/organ/ears/teshari
	customizer_choices = list(/datum/customizer_choice/organ/ears/teshari)
	allows_disabling = TRUE
	default_disabled = TRUE

/datum/customizer_choice/organ/ears/teshari
	name = "Teshari Ears"
	organ_type = /obj/item/organ/ears
	sprite_accessories = list(
		/datum/sprite_accessory/ears/teshari,
		/datum/sprite_accessory/ears/tesharihigh,
		/datum/sprite_accessory/ears/tesharilow,
		)

/datum/sprite_accessory/ears/teshari
	name = "Teshari"
	icon = 'modular_ochrevalley/icons/mob/sprite_accessory/ears/teshari.dmi'
	icon_state = "teshari"
	color_keys = 2
	color_key_names = list("Ears", "Inner")
	relevant_layers = list(BODY_ADJ_LAYER)

/datum/sprite_accessory/ears/tesharihigh
	name = "Teshari (High)"
	icon = 'modular_ochrevalley/icons/mob/sprite_accessory/ears/teshari.dmi'
	icon_state = "tesharihigh"
	color_keys = 2
	color_key_names = list("Ears", "Inner")
	relevant_layers = list(BODY_ADJ_LAYER)

/datum/sprite_accessory/ears/tesharilow
	name = "Teshari (Low)"
	icon = 'modular_ochrevalley/icons/mob/sprite_accessory/ears/teshari.dmi'
	icon_state = "tesharilow"
	color_keys = 2
	color_key_names = list("Ears", "Inner")
	relevant_layers = list(BODY_ADJ_LAYER)
