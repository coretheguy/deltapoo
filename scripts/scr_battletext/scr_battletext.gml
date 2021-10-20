function scr_terminate_writer() {
    __writerkilled = 0
    __writerkillable = 0
    __writerended = 0
    if instance_exists(obj_writer)
    {
        obj_writer.__endcheckid = id
        with (obj_writer)
        {
            if (reachedend == 1)
            {
                with (__endcheckid)
                    __writerended++
            }
        }
        if (__writerended == instance_number(obj_writer))
            __writerkillable = 1
    }
    else
        __writerkilled = 1
    if (button1_p() && __writerkillable == 1)
    {
        with (obj_writer)
            instance_destroy()
        __writerkilled = 1
    }
    return __writerkilled;
}

function scr_simultext(char) {
    __simulorder = 0
    if (argument0 == "kris")
        __simulorder = simulorderkri
    if (argument0 == "susie")
        __simulorder = simulordersus
    if (argument0 == "ralsei")
        __simulorder = simulorderral
    if (argument0 == "noelle")
        __simulorder = simulordernoe
    __yoffset = (__simulorder * 30)
    global.typer = 4
    battlewriter = instance_create((xx + 30), ((yy + 376) + __yoffset), obj_writer)
    return;
}

function scr_battletext_default() {
    global.fc = 0
    global.typer = 4
    scr_battletext()
    return battlewriter;
}

function scr_mercyadd(enid, amt) {
    global.mercymod[argument0] += argument1
    if (global.mercymod[argument0] < 0)
        global.mercymod[argument0] = 0
    if (global.mercymod[argument0] >= 100)
        global.mercymod[argument0] = 100
    var _playsound = true
    if (argument1 <= 0)
        _playsound = false
    if i_ex(obj_dmgwriter)
    {
        with (obj_dmgwriter)
        {
            if (type == 5)
                _playsound = false
        }
    }
    if _playsound
    {
        var _pitch = 0.8
        if (argument1 < 99)
            _pitch = 1
        if (argument1 <= 50)
            _pitch = 1.2
        if (argument1 <= 25)
            _pitch = 1.4
        snd_play_x(snd_mercyadd, 0.8, _pitch)
    }
    __mercydmgwriter = instance_create(global.monsterx[argument0], ((global.monstery[argument0] + 20) - (global.hittarget[argument0] * 20)), obj_dmgwriter)
    __mercydmgwriter.damage = argument1
    __mercydmgwriter.type = 5
    global.hittarget[argument0] = (global.hittarget[argument0] + 1)
    return;
}

function scr_blconskip(sk) {
    if (argument0 >= 0)
    {
        if (button1_p() && talktimer > argument0)
            talktimer = talkmax
        talktimer += 1
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy()
            global.mnfight = 2
        }
    }
    else if (argument0 == -1)
    {
        if (instance_exists(obj_writer) == 0)
            global.mnfight = 2
    }
    else if (argument0 == -2)
    {
        talktimer += 1
        if (talktimer > 15)
            talktimer = talkmax
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy()
            global.mnfight = 2
        }
    }
    return;
}



function scr_enemyblcon(xx, yy, con) {
    if (argument2 == 0)
    {
        mywriter = instance_create(argument0, argument1, obj_writer)
        return mywriter;
    }
    if (argument2 == 1)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        return myblcon;
    }
    if (argument2 == 2)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_v
        return myblcon;
    }
    if (argument2 == 3)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        return myblcon;
    }
    if (argument2 == 4)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 0
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 5)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 1
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 6)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 7)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_r
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 8)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_tall
        return myblcon;
    }
    if (argument2 == 10)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        myblcon.auto_length = true
        return myblcon;
    }
    return;
}

function scr_moveheart() {
    global.inv = 0
    if (global.chapter == 2 && instance_exists(obj_gigaqueen_enemy))
        return instance_create((o_boxingcontroller.x + 4), (o_boxingcontroller.y - 120), obj_moveheart);
    else
        return instance_create((obj_herokris.x + 10), (obj_herokris.y + 40), obj_moveheart);
}

function scr_messagepriority(pri) {
    if i_ex(obj_battlecontroller)
    {
        if (obj_battlecontroller.messagepriority < argument0)
        {
            obj_battlecontroller.messagepriority = argument0
            return 1;
        }
        else
            return 0;
    }
    else
        return 0;
}

