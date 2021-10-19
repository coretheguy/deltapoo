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
	
//global.msg[0] = stringsetloc("* The gash weaves down as if you cry./%", "obj_npc_room_slash_Other_10_gml_13_0")

msgsetloc(msginfo[0], msginfo[1], msginfo[2])

for (var i = 0; i < array_length(msgnextinfo); i++) {
	
	msgnextloc(msgnextinfo[i][0], msgnextinfo[i][1])
}

remanimspeed = image_speed
myinteract = 3
mydialoguer = instance_create(0, 0, obj_dialoguer)
mydialoguer.jpspecial = jpspecial
talked += 1
