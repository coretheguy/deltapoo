scr_speaker(speaker)

if array_length(msginfo) > 3 
	scr_anyface(speaker, msginfo[0], msginfo[3])

msgsetloc(msginfo[0], msginfo[1], msginfo[2])

for (var i = 0; i < array_length(msgnextinfo); i++) {
	
	if array_length(msgnextinfo[i]) > 2
		scr_anyface_next(msgnextinfo[i][2], (array_length(msgnextinfo[i]) > 3 ? msgnextinfo[i][3] : 1))
	
	msgnextloc(msgnextinfo[i][0], msgnextinfo[i][1])
}

myinteract = 3
global.msc = 0

if typer == -1 {
	global.typer = 5
	if global.darkzone = true
		global.typer = 6
} else if speaker == "no_name" { global.typer = typer } 

global.fc = 0
global.fc = 0
global.interact = 1
mydialoguer = instance_create(0, 0, obj_dialoguer)
