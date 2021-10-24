if scr_debug()
{
    if keyboard_check_pressed(vk_f12)
    {
        global.inv = -1
        target = 4
        damage = (global.monsterat[myself] * 5)
        scr_damage()
    }
}
if (global.monster[myself] == true)
{
    if (scr_isphase("enemytalk") && talked == false)
    {
        scr_randomtarget()
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener)
        global.typer = 50
        rr = choose(0, 1, 2, 3)
        if (rr == 0)
            msgset(0, "Hello!")
        if (rr == 1)
            msgset(0, "Are you? &And are?")
        if (rr == 2)
            msgset(0, "Welcome to &friendship!")
        if (rr == 3)
            msgset(0, "Good after  !")
        scr_enemyblcon((x - 160), y, 3)
        talked = true
        talktimer = 0
    }
    if (talked == true && scr_isphase("enemytalk"))
    {
        rtimer = 0
        scr_blconskip(15)
        if scr_isphase("bullets")
        {
            if (!instance_exists(obj_moveheart))
                scr_moveheart()
            if (!instance_exists(obj_growtangle))
                instance_create((__view_get(0, 0) + 320), (__view_get(1, 0) + 170), obj_growtangle)
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
                global.monsterattackname[myself] = "HiAndHello"
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
                dc.type = 1021
            }
            else
            {
                global.monsterattackname[myself] = "YouveGotMail"
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
                dc.type = 1022
            }
            scr_turntimer(140)
            turns += 1
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3)
            if scr_messagepriority(random(2))
            {
                var substring = string(myself)
                if (rr == 0)
                    global.battlemsg[0] = "Chat-Bot talks to itself."
                if (rr == 1)
                    global.battlemsg[0] = "Chat-Bot replays a clip of you from five seconds ago."
                if (rr == 2)
                    global.battlemsg[0] = "Chat-Bot fakes emotion."
                if (rr == 3)
                    global.battlemsg[0] = "Chat-Bot clips a video of you."
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if scr_messagepriority((100 + random(2)))
                {
                    substring = string(myself)
                    global.battlemsg[0] = "Chat-Bot snickers."
                }
            }
            attacked = true
        }
        else
            scr_turntimer(120)
    }
}
if (global.myfight == 3)
{
    xx = __view_get(0, 0)
    yy = __view_get(1, 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        msgset(0, "* Chat-Bot - Neesd more local friends./%")
        scr_battletext_default()
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1
            msgset(0, "* You talked to Chat-Bot. It can't process anything./%")
			scr_mercyadd(myself, 40)
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
