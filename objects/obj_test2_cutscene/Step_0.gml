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
	
	spaton.image_angle = -60
	
	
	c_sel(spaton)
	c_speaker("spamton")
	c_msgset(0, "* KRIS!! WAIT JUST A [Darn Hecking] MINUTE!/%")
	c_talk()
	c_wait_box(1)
	c_var_lerp_instance(spa_ctor, "x", spa_ctor.x, obj_mainchara.x + 40, 30, 1, "out")
	c_var_lerp_instance(spa_ctor, "image_angle", spa_ctor.image_angle, 0, 30, 1, "out")
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