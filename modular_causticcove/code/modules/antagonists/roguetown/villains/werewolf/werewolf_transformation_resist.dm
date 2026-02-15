/datum/antagonist/werewolf/Topic(href, href_list)
    . = ..()
    var/mob/living/carbon/human/user = usr
    var/datum/mind/user_mind = user?.mind
    if(!user_mind) return // Sanity check
    if(href_list["task"] == "apply_transform_resistance" && owner == user_mind && !ignore_transformation_resist) // Make sure the person clicking this is actually the user!
        apply_transform_resistance(user)
    

/datum/antagonist/werewolf/proc/apply_transform_resistance(var/mob/living/carbon/human/user)
    to_chat(user, span_danger("I <b>RESIST</b> the Sun-Tyrant's will! As long as I stay away from the direct sunlight, I can keep my form... but my resistance has come with a toll. (Remember that the ability to resist un-transformation is strictly a scene tool. Do not abuse this!)"))
    resisting_transformation = TRUE
    user.apply_status_effect(/datum/status_effect/debuff/werewolf_transformation_resistance)
    untransforming = FALSE

/datum/antagonist/werewolf/proc/remove_transform_resistance(var/mob/living/carbon/human/user)
    to_chat(user, span_notice("The pale light of the moon re-invigorates me. Astrata's scorn fades... My MIGHT is restored!"))
    resisting_transformation = FALSE
    user.remove_status_effect(/datum/status_effect/debuff/werewolf_transformation_resistance)

/datum/status_effect/debuff/werewolf_transformation_resistance
    id = "werewolf_resisting_sun"
    alert_type = /atom/movable/screen/alert/status_effect/debuff/werewolf_transformation_resistance
    effectedstats = list(STATKEY_SPD = -2, STATKEY_STR = -6, STATKEY_CON = -8, STATKEY_WIL = -8) // This is a scene tool! A massive stat debuff will help ensure it *stays* that way.

/atom/movable/screen/alert/status_effect/debuff/werewolf_transformation_resistance
	name = "The Price Of Defiance"
	desc = "I have resisted the Sun-Tyrant's will, but her outrage has ensured I have paid for doing so. My body feels feeble and sluggish. Only by standing underneath the moonlit sky will my strength be restored."
	icon_state = "debuff"