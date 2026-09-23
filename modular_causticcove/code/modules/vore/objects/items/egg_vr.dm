// Belly helpers
/obj/belly/proc/create_egg()
	var/egg_path = /obj/item/vore_egg
	if(egg_type in GLOB.tf_vore_egg_types)
		egg_path = GLOB.tf_vore_egg_types[egg_type]

	var/obj/item/vore_egg/egg_in_progress = new egg_path(src)

	log_game("Egg created by [key_name(usr)] in [key_name(owner)]")
	egg_in_progress.creator = "[key_name(owner)]"

	if(egg_name)
		egg_in_progress.egg_name = egg_name
		egg_in_progress.name = egg_name

	if(egg_size)
		egg_in_progress.transform = egg_in_progress.transform.Scale(egg_size, egg_size)

	return egg_in_progress

//Item type vorepanel egg release containers.
/obj/item/vore_egg //<-- Rewrite this to use the Holder? Cause it's basically going to _be_ a holder for a mob. And items?
	name = "egg"
	desc = "It's an egg; it's smooth to the touch." //This is the default egg.
	icon = 'modular_causticcove/icons/obj/egg.dmi'
	icon_state = "egg"
	var/creator
	var/use_sound = 'modular_causticcove/sound/cvore/flesh.ogg'
	var/egg_name = null
	var/open = FALSE

/obj/item/vore_egg/attack_self(mob/user)
	if(open)
		return
	visible_message(span_danger("[user] starts to open [src]..."))
	if(do_after(user, 5 SECONDS, target = src))
		drop_contents()

/obj/item/vore_egg/container_resist(mob/living/held)
	if(open)
		return drop_contents()
	if(isbelly(loc))
		var/obj/belly/B = loc
		B.relay_resist(held, src)
		return
	hatch(held)

/obj/item/vore_egg/examine(mob/user)
	. = ..()
	if(in_range(user, src))
		. += "It contains: [counting_english_list(contents)]"

/obj/item/vore_egg/proc/hatch(mob/living/user as mob)
	visible_message(span_danger("\The [src] begins to shake as something pushes out from within!"))
	animate_shake()
	if(do_after(user, 5 SECONDS, target = src))
		if(use_sound)
			playsound(src, src.use_sound, 50, 0, -5)
		animate_shake()
		drop_contents()

/obj/item/vore_egg/proc/drop_contents()
	visible_message(span_danger("Everything spills out of [src]!"))
	var/turf/T = get_turf(src)
	for(var/atom/movable/A in contents)
		A.forceMove(T)
	icon_state = "[initial(icon_state)]_open"
	open = TRUE

/obj/item/vore_egg/unathi
	name = "unathi egg"
	desc = "Some species of Unathi apparently lay soft-shelled eggs!"
	icon_state = "egg_unathi"

/obj/item/vore_egg/nevrean
	name = "nevrean egg"
	desc = "Most Nevreans lay hard-shelled eggs!"
	icon_state = "egg_nevrean"

/obj/item/vore_egg/human
	name = "human egg"
	desc = "Some humans lay eggs that are--wait, what?"
	icon_state = "egg_human"

/obj/item/vore_egg/tajaran
	name = "tajaran egg"
	desc = "Apparently that's what a Tajaran egg looks like. Weird."
	icon_state = "egg_tajaran"

/obj/item/vore_egg/skrell
	name = "skrell egg"
	desc = "Its soft and squishy"
	icon_state = "egg_skrell"

/obj/item/vore_egg/shark
	name = "akula egg"
	desc = "Its soft and slimy to the touch"
	icon_state  = "egg_akula"

/obj/item/vore_egg/sergal
	name = "sergal egg"
	desc = "An egg with a slightly fuzzy exterior, and a hard layer beneath."
	icon_state = "egg_sergal"

/obj/item/vore_egg/slime
	name = "slime egg"
	desc = "An egg with a soft and squishy interior, coated with slime."
	icon_state = "egg_slime"

/obj/item/vore_egg/special //Not actually used, but the sprites are in, and it's there in case any admins need to spawn in the egg for any specific reasons.
	name = "special egg"
	desc = "This egg has a very unique look to it."
	icon_state = "egg_unique"

/obj/item/vore_egg/scree
	name = "Chimera egg"
	desc = "...You don't know what type of creature laid this egg."
	icon_state = "egg_scree"

/obj/item/vore_egg/xenomorph
	name = "Xenomorph egg"
	desc = "Some type of pitch black egg. It has a slimy exterior coating."
	icon_state = "egg_xenomorph"

/obj/item/vore_egg/chocolate
	name = "chocolate egg"
	desc = "Delicious. May contain a choking hazard."
	icon_state = "egg_chocolate"

/obj/item/vore_egg/owlpellet
	name = "boney egg"
	desc = "Can an egg shell be made of bones and hair?"
	icon_state = "egg_pellet"

/obj/item/vore_egg/slimeglob
	name = "glob of slime"
	desc = "Very squishy."
	icon_state = "egg_slimeglob"

/obj/item/vore_egg/chicken
	name = "chicken egg"
	desc = "Looks like chickens come in all sizes and shapes."
	icon_state = "egg_chicken"

/obj/item/vore_egg/synthetic
	name = "synthetic egg"
	desc = "Smells like Easter morning."
	icon_state = "egg_synthetic"

/obj/item/vore_egg/escapepod
	name = "small escape pod"
	desc = "Someone left in a hurry."
	icon_state = "egg_escapepod"

/obj/item/vore_egg/floppy
	name = "blue space floppy disc"
	desc = "Probably shouldn't copy THIS floppy."
	icon_state = "egg_floppy"

/obj/item/vore_egg/cd
	name = "blue space cd"
	desc = "What could even be on this?!"
	icon_state = "egg_cd"

/obj/item/vore_egg/file
	name = "blue space file"
	desc = "Gotta wonder how much is compressed in there."
	icon_state = "egg_file"

/obj/item/vore_egg/badrecipe
	name = "Burned mess"
	desc = "Someone didn't cook this egg quite right..."
	icon_state = "egg_badrecipe"

/obj/item/vore_egg/cocoon
	name = "web cocoon"
	desc = "It straight up smells like spiders in here."
	icon_state = "egg_cocoon"

/obj/item/vore_egg/honeycomb
	name = "honeycomb"
	desc = "Smells delicious!"
	icon_state = "egg_honeycomb"

/obj/item/vore_egg/bugcocoon
	name = "bug cocoon"
	desc = "Metamorphosis!"
	icon_state = "egg_bugcocoon"

/obj/item/vore_egg/rock
	name = "rock egg"
	desc = "It looks like a small boulder."
	icon_state = "egg_rock"

/obj/item/vore_egg/yellow
	name = "yellow egg"
	desc = "It is a nice yellow egg."
	icon_state = "egg_yellow"

/obj/item/vore_egg/blue
	name = "blue egg"
	desc = "It is a nice blue egg."
	icon_state = "egg_blue"

/obj/item/vore_egg/green
	name = "green egg"
	desc = "It is a nice green egg."
	icon_state = "egg_green"

/obj/item/vore_egg/orange
	name = "orange egg"
	desc = "It is a nice orange egg."
	icon_state = "egg_orange"

/obj/item/vore_egg/purple
	name = "purple egg"
	desc = "It is a nice purple egg."
	icon_state = "egg_purple"

/obj/item/vore_egg/red
	name = "red egg"
	desc = "It is a nice red egg."
	icon_state = "egg_red"

/obj/item/vore_egg/rainbow
	name = "rainbow egg"
	desc = "It looks so colorful."
	icon_state = "egg_rainbow"

/obj/item/vore_egg/pinkspots
	name = "spotted pink egg"
	desc = "It is a cute pink egg with white spots."
	icon_state = "egg_pinkspots"
