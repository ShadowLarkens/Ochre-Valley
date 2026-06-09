/datum/job/roguetown/lord
	f_title = "Supreme Empress"
	n_title = "Supreme Empress"
	display_title = "Supreme Empress"

// Only Supreme Empress Aether may play as the Supreme Empress
/datum/job/roguetown/lord/special_job_check(mob/dead/new_player/player)
	if(player.ckey != SUPREME_EMPRESS_CKEY)
		return FALSE
	return TRUE