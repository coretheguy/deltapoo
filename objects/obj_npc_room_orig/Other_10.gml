global.msc = 0
global.typer = 5
if (global.darkzone == true)
    global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
image_speed = 0.2
if (global.darkzone == true)
    image_speed = 0.2	

scr_speaker("no_name")

switch text {
	
	case 100010:
		
		if talked = 0 {
			scr_anyface("no_name", 0, 0)
			scr_speaker("no_name")
			msgset(0, "* This bench is too small for me. I can't catch a break around here./")
			msgnext("* My legs are getting cold. The city is too loud for me./")
			scr_speaker("susie")
			scr_anyface_next("susie", 0)
			msgnext("* Jeez, what's your deal?/")
			scr_anyface_next("no_name", 0)
			scr_speaker("no_name")
			msgnext("* Whoa! Didn't see you, there. You didn't hear any of that, did you?/")
			scr_speaker("susie")
			scr_anyface_next("susie", 0)
			msgnext("* .../")
			scr_anyface_next("susie", 2)
			msgnext("* Nope. None of it./%")
		}
		else {
			
			scr_speaker("no_name")
			msgset(0, "* ..What? I didn't say anything./%")
		}
		
		break
	
	default: 
		global.msg[0] = stringset("* [NO TEXT] (obj_npc_room)/%")
		break;
}

remanimspeed = image_speed
myinteract = 3
mydialoguer = instance_create(0, 0, obj_dialoguer)
mydialoguer.jpspecial = jpspecial
talked += 1
