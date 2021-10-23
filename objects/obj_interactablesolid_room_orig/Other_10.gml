global.msc = 0
global.typer = 5
if (global.darkzone == true)
    global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
global.msg[0] = stringsetloc("* The gash weaves down as if you cry./%", "obj_npc_room_slash_Other_10_gml_13_0")
global.msg[0] = stringset("* [NO TEXT] (obj_interactablesolid_room_orig)/%")


switch text {
	
	case 10050:
//	speaker = "queen"

//msginfo = [0, "* Bro I Think Spam Boy Completely Lost It Lmao/", "idontcarelmao1", 1]

//msgnextinfo[0] = ["* He's Not Even Moving/", "idontcarelmao2", "queen", 15]
//msgnextinfo[1] = ["* Do you think he's...uh.../", "idontcarelmao3", "noelle", 5]
//msgnextinfo[2] = ["* No/%", "idontcarelmao4", "queen", 13]

		
		scr_smallface(0, "susie", 0, "rightmid", "bottom", stringset("(This was a bad idea..)"))
		
		scr_speaker("queen")
		scr_anyface("queen", 0, 1)
		msgset(0, "* Bro I Think Spammy Boy Completely Lost It Lmao/")
		scr_anyface_next("queen", 15)
		msgnext("* He's Not Even Moving/")
		scr_anyface_next("noelle", 5)
		msgnext("* Um, do you think he's...uh.../")
		scr_anyface_next("queen", 13)
		msgnext("* Noelle Sweety Gravy Honey Mustard Don't Be Silly\\f0/%")
		
		
	
	default: break
}

myinteract = 3
mydialoguer = instance_create(0, 0, obj_dialoguer)
mydialoguer.jpspecial = jpspecial
talked += 1
