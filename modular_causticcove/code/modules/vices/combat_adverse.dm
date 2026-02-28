/datum/stressevent/cablood
	timer = 20 SECONDS
	stressadd = 3
	desc = span_red("There is so much blood around... What happened here?!")

/datum/stressevent/caincombat
	timer = 30 SECONDS
	stressadd = 5
	desc = span_red("I'm in the heat of battle! I need to get to safety!")

/datum/stressevent/cawornblood
	timer = 1 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 1
	desc = span_red("I got blood all over my clothes! I need to get it off of me!")

/datum/charflaw/combat_adverse
	name = "Combat Adverse"
	desc = "I really do not enjoy fighting or combat. Blood and extended battles really stress me out."
	var/last_check = 0
	var/last_gear_check = 0
	var/combat_mode_ticks = 0

/datum/charflaw/combat_adverse/flaw_on_life(mob/user)
	if(world.time < last_check + 10 SECONDS)
		return
	last_check = world.time
	if(!user)
		return
	var/cnt = 0
	for(var/obj/effect/decal/cleanable/blood/B in view(7, user)) //Run the check for blood around the player!
		cnt++
		if(cnt > 6)
			break
	if(cnt > 6)
		user.add_stress(/datum/stressevent/cablood)
	
	var/mob/living/carbon/human/human_user = user //Cast to human!
	if(!istype(human_user))
		return

	if(human_user.cmode) //Check if the player is in combat mode, and increment the ticker...
		if(combat_mode_ticks < 3)
			combat_mode_ticks++
		else
			user.add_stress(/datum/stressevent/caincombat) //If it hits 3 ticks, IE 30 seconds in combat mode, you are considered in the heat of battle!
	else
		combat_mode_ticks = 0 //Reset the counter when cmode is turned off!

	if(world.time < last_gear_check + 30 SECONDS) //Run the gear check every 30 seconds instead of every 10, so for every 3 checks of the prior two, this one is checked 1 time
		return
	last_gear_check = world.time
	cnt = 0
	var/equipped = human_user.get_equipped_items()
	for(var/obj/item/gear in equipped) //Check all worn gear (not held!) for if it currently has blood on it! If so, add a stack up to 3.
		var/datum/component/decal/blood/bloodcomp = gear.GetComponent(/datum/component/decal/blood)
		if(bloodcomp)
			cnt++
			user.add_stress(/datum/stressevent/cawornblood)
		if(cnt > 2)
			break
