/*/obj/screen/fullscreen/proc/update_for_view(client_view) //Why was this copied over into here when we have this file in code\_onclick\hud\fullscreen.dm
	if (screen_loc == "CENTER-7,CENTER-7" && view != client_view)
		var/list/actualview = getviewsize(client_view)
		view = client_view
		transform = matrix(actualview[1]/15, 0, 0, 0, actualview[2]/15, 0)

/obj/screen/fullscreen
	icon = 'icons/mob/screen_full.dmi'
	icon_state = "default"
	screen_loc = "CENTER-7,CENTER-7"
	layer = FULLSCREEN_LAYER
	plane = PLANE_FULLSCREEN
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/view = 7
	var/severity = 0
	var/show_when_dead = FALSE

/obj/screen/fullscreen/proc/should_show_to(mob/mymob)
	if(!show_when_dead && mymob.stat == DEAD)
		return FALSE
	return TRUE*/

/obj/item
	var/digestable = TRUE
	var/list/possessed_voice //Allows for items to be possessed/inhabited by voices.
	var/list/warned_of_possession //Checks to see who has been informed this item is possessed.

	//Vorestuff
	var/trash_eatable = FALSE
	var/digest_stage = null
	var/d_mult_old = 1 //digest stage descriptions
	var/d_mult = 1 //digest stage descriptions
	var/d_stage_overlay //digest stage effects
	var/gurgled = FALSE
	var/oldname
	var/cleanname
	var/cleandesc
	var/gurgled_color
	

