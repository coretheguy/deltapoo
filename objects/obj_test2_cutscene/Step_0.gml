if obj_mainchara.x >= x and con = 0 and global.interact = 0 {
	
	con = 1
	global.interact = 1
}


if (con == 1)
{
    con = 2
    cutscene_master = scr_cutscene_make()
	
	spaton = 0
	
	spa_ctor = instance_create(obj_mainchara.x - 8, obj_mainchara.y + 1, obj_actor)
	
	scr_actor_setup(spaton, spa_ctor, spr_spamton_drag)
	
	spa_ctor.image_angle = -60
	
	
	c_sel(spaton)
	c_speaker("spamton")
	c_msgsetloc(0, "* KRIS!! WAIT JUST A [[Tootin']] MINUTE!/%", "obj_test2_cutscene_slash_Step_0_gml_24_0")
	c_talk_wait()
	
	c_pannable(true)
	c_pan(camerax() + 50, 0, 10)
	c_wait(20)
	
	
	c_var_lerp("image_angle", spa_ctor.image_angle, 0, 5, 2, "out")
	c_jump(obj_mainchara.x + 130, obj_mainchara.y, 15, 15)
	c_wait(50)
	
	c_mus("free_all")
	c_mus2("initloop", "spamton_meeting.ogg", 0)
	c_mus2("pitch", 0.84)
	
	c_var_lerp("siner_amplitude0", 0, 10, 10, 1)
	c_var("siner_add0", 0.1)
	
	
	c_speaker("spamton")
	c_msgsetloc(0, "* THIS ISN;T MY [[Lost your Car Keys]]!/", "obj_test2_cutscene_slash_Step_0_gml_30_0")
	c_msgnextloc("* THIS ISN'T [[Affordable deals]] [[Half Off Today Only!!]]!!/%", "oT2CSST0GML_31")
	c_talk()
	
	c_wait_box(1)
	//c_shakeobj()
	c_var("siner_add0", 0.3)
	
	c_wait_talk()
	
	
	
}

if (con == 2)
{
    if (!instance_exists(obj_cutscene_master))
    {
        con = 3
        global.interact = 0
    }
}