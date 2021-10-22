global.msc = 0
global.typer = 5
if (global.darkzone == true)
    global.typer = 6
global.fc = 0
global.fe = 0
global.interact = 1
nodialogue = 1
global.currentroom = room

switch room {
	
	default:
		nodialogue = 0
		msgset(0, "* You are filled with a certain power...")
}

myinteract = 3
if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer)
talked += 1
snd_play(snd_power)
for (i = 0; i < 5; i += 1)
{
    if (global.hp[i] < global.maxhp[i])
        global.hp[i] = global.maxhp[i]
}