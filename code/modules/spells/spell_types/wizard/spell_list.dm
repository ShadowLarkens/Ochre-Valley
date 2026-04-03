/* Utility spells - non-combat support magic or very niche in combat spells meant to be freely available
to all mage classes.
*/
GLOBAL_LIST_INIT(utility_spells, (list(
		/obj/effect/proc_holder/spell/self/light,
		/obj/effect/proc_holder/spell/invoked/mending,
		/obj/effect/proc_holder/spell/self/message,
		/obj/effect/proc_holder/spell/invoked/mindlink,
		/obj/effect/proc_holder/spell/self/findfamiliar,
		/obj/effect/proc_holder/spell/invoked/create_campfire,
		/obj/effect/proc_holder/spell/invoked/projectile/lesser_fetch,
		/obj/effect/proc_holder/spell/invoked/projectile/lesser_repel,
		/obj/effect/proc_holder/spell/targeted/touch/lesserknock,
		/obj/effect/proc_holder/spell/targeted/touch/nondetection,
		/obj/effect/proc_holder/spell/invoked/darkvision, // Buff but it is fine to also put it in this list
		/obj/effect/proc_holder/spell/self/magicians_brick,
		/obj/effect/proc_holder/spell/invoked/mirror_transform_ov, //OV Add
		/obj/effect/proc_holder/spell/self/aetherknife, //OV Add
		/obj/effect/proc_holder/spell/targeted/touch/sizespell, //OV Add
		)
))

// Augmentation spells - self-buffs safe for certain types of shared pool
// No invisibility (too strong).
GLOBAL_LIST_INIT(augmentation_spells, (list(
		/obj/effect/proc_holder/spell/invoked/haste,
		/obj/effect/proc_holder/spell/invoked/darkvision,
		/obj/effect/proc_holder/spell/invoked/longstrider,
		/obj/effect/proc_holder/spell/invoked/stoneskin,
		/obj/effect/proc_holder/spell/invoked/hawks_eyes,
		/obj/effect/proc_holder/spell/invoked/giants_strength,
		/obj/effect/proc_holder/spell/invoked/fortitude,
		/obj/effect/proc_holder/spell/invoked/guidance,
		/obj/effect/proc_holder/spell/invoked/featherfall,
		)
))

// Summoning spells - creature summoning magic
GLOBAL_LIST_INIT(summoning_spells, (list(
		/obj/effect/proc_holder/spell/invoked/conjure_primordial,
		// /obj/effect/proc_holder/spell/invoked/raise_deadite, // Zizo-only, consider separate evil list
		)
))

/proc/get_spell_pool_list(pool_name)
	switch(pool_name)
		if("utility")
			return GLOB.utility_spells
		if("augmentation")
			return GLOB.augmentation_spells
		if("summoning")
			return GLOB.summoning_spells
	return list()
