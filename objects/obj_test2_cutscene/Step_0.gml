if obj_mainchara.x >= x and con = 0 and global.interact = 0 {
	
	con = 1
	global.interact = 1
	
	
}

if con = 1 {
	
	global.facing = 1
	con = 2
    cutscene_master = scr_cutscene_make()
	scr_maincharacters_actors()
	
	spaton = 0
	
	spa_ctor = instance_create(kr_actor.x - 8, kr_actor.y + 1, obj_actor)
	
	scr_actor_setup(spaton, spa_ctor, spr_spamton_drag)
	
	spa_ctor.image_angle = -60
}

if (con == 2)
{
    
	
	
	c_sel(spaton)
	c_speaker("spamton")
	c_msgsetloc(0, "* KRIS!! WAIT JUST A [[Tootin']] MINUTE!/%", "obj_test2_cutscene_slash_Step_0_gml_24_0")
	c_talk_wait()
	
	c_mus2("volume", 0, 40)
	
	c_pannable(true)
	c_pan(camerax() + 50, 0, 10)
	c_wait(20)
	
	
	c_var_lerp("image_angle", spa_ctor.image_angle, 0, 0.8, 2, "out")
	c_jump(kr_actor.x + 130, kr_actor.y, 15, 15)
	c_wait(50)
	
	c_mus("free_all")
	c_mus2("initloop", "spamton_meeting.ogg", 0)
	c_mus2("pitch", 0.84)
	c_mus2("volume", 1, 1)
	
	c_sprite(spr_spamton_idle)
	c_var_lerp("siner_amplitude0", 0, 10, 10, 1)
	c_var("siner_add0", 0.1)
	
	
	c_speaker("spamton")
	c_msgsetloc(0, "* THIS ISN;T MY [[Lost your Car Keys]]!/", "obj_test2_cutscene_slash_Step_0_gml_30_0")
	c_msgnextloc("* THIS ISN'T [[Affordable deals]] [[Half Off Today Only!!]]!!/%", "oT2CSST0GML_31")
	c_talk()
	
	c_wait_box(1)
	//c_shakeobj()
	c_var("siner_add0", 0.3)
	
	
	c_waittalk()
	c_var("siner_add0", 0)
	c_sprite(spr_cutscene_14_spamton_hands_look_down_dark)
	c_choice(0, stringset("#Let's go back"))
	c_choice(1, stringset("#Proceed"))
	c_msc(10010)
	c_msgset(0, "* THE MANSION./")
	c_msgnext("* YOU CAN'T [[Store]] ME IN THERE KRIS!/")
	c_msgnext("* THEY'RE GONNA THEY'RE GONNA THEY'RE GONNA THEY'RE GONNA/")
	c_msgnext("\\C2 ")
	
	
	c_wait_box(1)
	c_var("shakeamt", 1)
	c_sprite(spr_cutscene_14_spamton_grab)
	
	c_wait_box(2)
	c_var("shakeamt", 2)
	
	c_talk_wait()
	
	
	
}

if con = 10 {
	
	con = 11
	c_sel(spaton)
	c_speaker("spamton")
	c_var("shakeamt", 0)
	c_sprite(spr_spamton_idle)
	c_msgset(0, "* WAIT!!! [[Don't Move an Inch]]!/")
	c_msgnext("* [[You]] CAN SHOW THOSE [Half Priced Sallamy] WHOS BOSS!!!/")
	c_msgnext("* LET'S GO./%")
	
	c_wait_box(1)
	c_sel(kr)
	c_facing("d")
	c_sel(spaton)
	c_sprite(spr_cutscene_14_spamton_arms_up)
	
	c_wait_box(2)
	c_sel(kr)
	c_facing("r")
	c_sel(spaton)
	c_sprite(spr_spamton_idle)
	c_mus2("volume", 0, 30)
	
	c_talk_wait()
	
	c_jump_wait(kr_actor.x, kr_actor.y, 15, 15)
	
	
	
}

if con = 11 {
	
	con = 59
	alarm[0] = 30
	global.facing = 0
	c_actortokris()
	c_pan_wait(camerax() - 50, 0, 10)
	c_pannable(false)
	c_terminatekillactors()
	
}

if con = 60 and !i_ex(obj_cutscene_master)
{
	global.interact = 0
	global.facing = 0
	con = 100000
}

if (con == 2)
{
    if (!instance_exists(obj_cutscene_master))
    {
        con = 3
        global.interact = 0
    }
}