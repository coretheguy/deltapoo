if (global.monster[myself] == true)
{
    if (scr_isphase("enemytalk") && talked == false)
    {
        scr_randomtarget()
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener)
        talked = true
        talktimer = 0
    }
    if (talked == true && scr_isphase("enemytalk"))
    {
        rtimer = 0
        scr_blconskip(-1)
        if scr_isphase("bullets")
        {
            if ((!instance_exists(obj_moveheart)) && (!i_ex(obj_heart)))
                scr_moveheart()
            if (!instance_exists(obj_growtangle))
                instance_create((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle)
        }
    }
    if (scr_isphase("bullets") && attacked == false)
    {
        rtimer += 1
        if (rtimer == 12)
        {
            rr = choose(0, 1)
            if (rr == 0)
            {
                global.monsterattackname[myself] = "DogBullets"
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
                dc.type = 1010
                dc.damage = 50
                dc.btimer = 0
                dc.creatorid = id
            }
			if rr == 1 {
				
				global.monsterattackname[myself] = "DoggySleepTime"
				dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
				dc.type = 1011
				dc.damage = 80
				dc.btimer = 0
				dc.creatorid = id
			}
            scr_turntimer(160)
            turns += 1
            global.typer = 6
            global.fc = 0
			rr = choose(0, 1)
            if scr_messagepriority(random(2)) {
				
				if rr = 0
					global.battlemsg[0] = "* Dog."
				if rr = 1
					global.battlemsg[0] = "* The dog."
			}
            attacked = true
        }
        else
            scr_turntimer(160)
    }
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
		msgset(0, "ANNOYING DOG - A dog that's inconveniently great at getting in the way./%")
        scr_battletext_default()
	}
	if acting = 2 and actcon = 0 {
		
		actcon = 1
		msgset(0, "* You tried to escape, but a dog blocked the way./%")
		scr_battletext_default()
	}
    if ((actingsus == true && actconsus == 1) || (actingral == true && actconral == 1))
    {
        msgsetloc(0, "* The act was replaced by a dog./%", "obj_pipis_enemy_slash_Step_0_gml_110_0")
        scr_battletext_default()
        if (actingsus == true && actconsus == 1)
        {
            actcon = 1
            actconsus = 0
        }
        if (actingral == true && actconral == 1)
        {
            actcon = 1
            actconral = 0
        }
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if scr_terminate_writer()
        {
            actconsus = -1
            actconral = -1
            actcon = 1
        }
    }
    if (actcon == 1 && (!instance_exists(obj_writer)))
        scr_nextact()
}