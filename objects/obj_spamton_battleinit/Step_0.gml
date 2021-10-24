if (con == 1.1)
    con = 1.2
if (obj_mainchara.x > x && con == -1)
{
    con = 1.1
    global.interact = 1
    global.facing = 1
	snd_volume(global.currentsong[1], 0, 50)
}

if (con == 1.2)
{
    con = 1
    cutscene_master = scr_cutscene_make()
    scr_maincharacters_actors()
    sp = 2
    sp_actor = instance_create((camerax() + 140), 120, obj_actor)
    scr_actor_setup(sp, sp_actor, "spamton")
    sp_actor.sprite_index = spr_spamton_idle
    //du = 3
    //du_actor = scr_dark_marker(560, 106, spr_cutscene_14_dumpster_1_closed)
    //scr_actor_setup_nofacing(du, du_actor, "dumpster")
    //c_sel(du)
    //c_autodepth(0)
    //c_depth(6000)
    //c_visible(1)
    //dumpster.visible = false
    cutscene_master.save_object[0] = id
    c_sel(sp)
    c_autowalk(false)
    c_imagespeed(0)
}

if (con == 1 || scr_cutscene_loaded())
{
    con = 2
	c_soundplay(snd_locker)
	c_sel(sp)
    c_setxy(kr_actor.x + 105, kr_actor.y + 45)
	
	c_shakeobj()
	c_wait(20)
	c_speaker("spamton")
	c_msgset(0, "* fight me/%")
	c_talk_wait()
	c_mus2("initloop", "spamton_laugh_noise.ogg", 0)
    c_autowalk(false)
    c_sprite(spr_spamton_laugh_left)
    c_imagespeed(0.25)
    c_wait(45)
    c_mus("stop")
	c_pannable(true)
	c_waitcustom()
}

if (con == 2 && customcon == 1)
{
    con = 3
    alarm[0] = 30
    if (global.tempflag[29] == 0)
        global.tempflag[29] = 1
    var spamton_marker = scr_dark_marker(sp_actor.x, sp_actor.y, sp_actor.sprite_index)
    global.flag[9] = 2
    global.batmusic[0] = snd_init("spamton_battle.ogg")
    encounterflag = 549
    global.flag[54] = encounterflag
    scr_battle(60, true, spamton_marker, 0, 0)
    global.flag[9] = 1
    with (obj_actor)
        visible = false
}

if (con == 4 && i_ex(obj_battlecontroller))
{
    var battle_end = 0
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = 1
    }
    if battle_end
    {
        con = 6
        alarm[0] = 30
        snd_volume(global.batmusic[1], 0, 25)
    }
}

if (con == 7)
{
    con = 8
    alarm[0] = 5
    customcon = 0
    obj_mainchara.x = obj_herokris.x
    obj_mainchara.y = obj_herokris.y
    kr_actor.x = obj_herokris.x
    kr_actor.y = obj_herokris.y
    kr_actor.sprite_index = obj_herokris.sprite_index
    sp_actor.x = obj_spamton_enemy.x
    sp_actor.y = obj_spamton_enemy.y
    sp_actor.sprite_index = spr_spamton_idle
    sp_actor.image_index = 0
    sp_actor.image_speed = 0
    with (obj_actor)
        visible = true
    snd_free(global.batmusic[0])
    snd_volume(global.currentsong[1], 0, 0)
    snd_resume(global.currentsong[1])
    snd_volume(global.currentsong[1], 1, 20)
    with (obj_monsterparent)
        instance_destroy()
    with (obj_bulletparent)
        instance_destroy()
    with (obj_heroparent)
        instance_destroy()
    if i_ex(obj_battleback)
    {
        with (obj_battleback)
            destroy = 1
    }
    if i_ex(obj_battlecontroller)
        instance_destroy(obj_battlecontroller)
}

if con == 9 and !i_ex(obj_battlecontroller) {
	
	con = 39
	alarm[0] = 30
	global.fighting = false
    c_waitcustom_end()
	c_wait(30)
	c_sel(sp)
	c_speaker("spamton")
	c_msgset(0, "* get out of my face/%")
	c_talk_wait()
	c_soundplay(snd_jump)
	c_jump(x, -100, 20, 30)
	c_wait(60)
	c_pannable(false)
}

if (con == 40 && (!d_ex()))
{
    con = 50
    c_actortokris()
    c_terminatekillactors()
}