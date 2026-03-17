/obj/effect/proc_holder/spell/self/aetherknife
	name = "Aetherknife"
	desc = "Congeal magickal energies into a blade which gains a bonus to power based on INT.\n\
	The blade lasts until a new one is summoned or the spell is forgotten. Deals physical damage."
	overlay_state = "conjure_weapon" //placeholder sorta, need to make a new spell dmi for our in-house stuff to avoid loathesome dmi conflicts
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 30
	recharge_time = 5 SECONDS // Needs to be quick

	warnie = "spellwarning"
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 2
	spell_tier = 2 // Spellblade tier.

	invocations = list("Desperta ferro!") // "Awake iron!", battlecry of the Almogavars.
	invocation_type = "shout"

	glow_color = GLOW_COLOR_ARCANE
	glow_intensity = GLOW_INTENSITY_LOW

	gesture_required = TRUE // Don't really matter
	var/obj/item/rogueweapon/conjured_knife = null

/obj/effect/proc_holder/spell/self/aetherknife/cast(list/targets, mob/living/user = usr)
	if(conjured_knife)
		conjured_knife.visible_message(span_warning("[conjured_knife] shimmers and fades away."))
		qdel(conjured_knife)
	var/obj/item/rogueweapon/R = new /obj/item/rogueweapon/aetherknife(user.drop_location())
	if(!QDELETED(R))
		R.AddComponent(/datum/component/conjured_item, GLOW_COLOR_ARCANE, user)

	if(user.STAINT > 10)
		var/int_scaling = user.STAINT - 10
		R.force = R.force + int_scaling
		R.throwforce = R.throwforce + int_scaling * 2 // 2x scaling for throwing. Let's go.
		R.name = "aetherknife +[int_scaling]"
	user.put_in_hands(R)
	src.conjured_knife = R
	return TRUE

/obj/effect/proc_holder/spell/self/aetherknife/Destroy()
	if(conjured_knife)
		conjured_knife.visible_message(span_warning("[conjured_knife] disintegrates into glittering motes!"))
		qdel(conjured_knife)
	return ..()

//this is otherwise just a 1:1 with the brick except that it's stab instead of smash, and scales with knife skill not mace skill
/obj/item/rogueweapon/aetherknife
	name = "aetherknife"
	desc = "A knife formed out of congealed magickal energies. Makes for a very deadly melee and throwing weapon."
	icon = 'icons/roguetown/weapons/daggers32.dmi'
	icon_state = "throw_knifesil"
	dropshrink = 0.75
	force = 15 // Copy pasted from real brick + 1 for neat number
	throwforce = 20 // +2 from real brick for neat scaling
	throw_speed = 4
	armor_penetration = 30 // From iron tossblade
	wdefense = 0
	wbalance = WBALANCE_NORMAL
	max_integrity = 50 // Don't parry with it lol
	slot_flags = ITEM_SLOT_MOUTH
	obj_flags = null
	w_class = WEIGHT_CLASS_TINY
	possible_item_intents = list(/datum/intent/dagger/thrust) // Limited to stab attacks, similar to the brick being limited to smashes
	associated_skill = /datum/skill/combat/knives // scales with knife skill, same as brick scales with mace skill
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
