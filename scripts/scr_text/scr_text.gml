function scr_text(mc_id){
	
	switch mc_id {
		case 0:
			break
		case 375:
            global.choicemsg[0] = stringsetloc("#1", "scr_text_slash_scr_text_gml_2398_0")
            global.choicemsg[1] = stringsetloc("#2", "scr_text_slash_scr_text_gml_2399_0")
            global.choicemsg[2] = stringsetloc("3", "scr_text_slash_scr_text_gml_2402_0")
            global.choicemsg[3] = stringsetloc("4", "scr_text_slash_scr_text_gml_2403_0_b")
            snd_play_x(snd_phone, 0.7, 1)
            global.msg[0] = stringsetloc("* (Ring^1, ring...)/", "scr_text_slash_scr_text_gml_2403_0")
            global.msg[1] = stringsetloc("* Hello./", "scr_text_slash_scr_text_gml_2404_0")
            global.msg[2] = stringsetloc("* You have reached the Hotline for Idiot Babies./", "scr_text_slash_scr_text_gml_2405_0")
            global.msg[3] = stringsetloc("* Please press 1 for Idiots^1, 2 for Babies^1, 3 for Idiot Babies^1, and 4 for None./", "scr_text_slash_scr_text_gml_2406_0")
            global.msg[4] = stringsetloc("\\C4 ", "scr_text_slash_scr_text_gml_2407_0")
            if (global.flag[274] == 2)
            {
                global.msg[0] = stringsetloc("* (Ring^1, ring...^1)&* (Ring^1, ring...^1)&* (Ring^1, ring...)/", "scr_text_slash_scr_text_gml_2410_0")
                global.msg[1] = stringsetloc("* (The phone kept ringing infinitely.)/%", "scr_text_slash_scr_text_gml_2411_0")
            }
            break
		case 376:
            if (global.flag[274] == 1)
                global.flag[274] = 2
            scr_phonename()
            global.msg[0] = stringsetloc("* Huh!?/", "scr_text_slash_scr_text_gml_2418_0")
            if (global.choice == 0)
            {
                global.msg[0] = stringsetloc("* Ah^1, you're an Idiot?/", "scr_text_slash_scr_text_gml_2419_0")
                global.flag[275] = 1
            }
            if (global.choice == 1)
            {
                global.msg[0] = stringsetloc("* Ah^1, you're an Baby?/", "scr_text_slash_scr_text_gml_2420_0")
                global.flag[275] = 2
            }
            if (global.choice == 2)
            {
                global.msg[0] = stringsetloc("* Ah^1, you're an Idiot Baby?/", "scr_text_slash_scr_text_gml_2421_0")
                global.flag[275] = 3
            }
            global.msg[1] = stringsetloc("* .../", "scr_text_slash_scr_text_gml_2422_0")
            global.msg[2] = stringsetloc("* To tell you the truth^1, I'm one too./", "scr_text_slash_scr_text_gml_2423_0")
            global.msg[3] = stringsetloc("* Let's try our best^1, OK?/", "scr_text_slash_scr_text_gml_2424_0")
            global.msg[4] = stringsetloc("* (Click...)/%", "scr_text_slash_scr_text_gml_2425_0")
            if (global.choice == 3)
            {
                global.msg[0] = stringsetloc("* Why'd you call the Hotline for Idiot Babies if you aren't an Idiot Baby?/", "scr_text_slash_scr_text_gml_2428_0")
                global.msg[1] = stringsetloc("* (Click...)/%", "scr_text_slash_scr_text_gml_2429_0")
            }
            break
	}

}

function scr_writetext(msc, msg, fc, typer) {
    global.fc = 0
    global.msc = argument0
    if (argument1 != "x")
        global.msg[0] = argument1
    if (argument2 != 0)
        global.fc = argument2
    global.typer = 5
    if (argument3 != 0)
        global.typer = argument3
    instance_create(0, 0, obj_dialoguer)
    return;
}

