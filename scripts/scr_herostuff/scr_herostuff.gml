function scr_retarget(char) {
    thistarget = global.chartarget[argument0]
    cancelattack = false
    if (thistarget == 0)
    {
        if (global.monster[0] == false)
            thistarget = 1
    }
    if (thistarget == 1)
    {
        if (global.monster[1] == false)
            thistarget = 2
    }
    if (thistarget == 2)
    {
        if (global.monster[2] == false)
            thistarget = 3
        if (thistarget == 3 && global.monster[0] == true)
            thistarget = 0
        if (thistarget == 3 && global.monster[1] == true)
            thistarget = 1
        if (thistarget == 3)
            cancelattack = true
    }
    global.chartarget[argument0] = thistarget
    return;
}

function scr_tensionheal(tp) {
    global.tension += argument0
    if (global.tension > global.maxtension)
        global.tension = global.maxtension
    return;
}

function scr_charcan(char) {
    charcan = true
    if (global.hp[global.char[argument0]] <= 0)
        charcan = false
    if (global.acting[argument0] == true)
        charcan = false
    if (global.char[argument0] == 0)
        charcan = false
    if (global.charmove[argument0] == false)
        charcan = false
    if (global.charauto[global.char[argument0]] == true)
        charcan = false
    return charcan;
}



function scr_nexthero() {
    moveswapped = false
    prevturn = global.charturn
    if (global.charturn == 0)
    {
        moveswapped = true
        if (global.charmove[1] == true && scr_charcan(1))
            global.charturn = 1
        else if (global.charmove[2] == true && scr_charcan(2))
            global.charturn = 2
        else
            scr_endturn()
    }
    if (global.charturn == 1 && moveswapped == false)
    {
        moveswapped = true
        if (scr_charcan(2) && global.acting[1] == false)
            global.charturn = 2
        else
            scr_endturn()
    }
    if (global.charturn == 2 && moveswapped == false)
        scr_endturn()
    if (moveswapped == true)
        global.bmenuno = 0
    if (global.charturn > 0)
    {
        global.temptension[global.charturn] = global.tension
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][prevturn]
    }
    return;
}


function scr_prevhero() {
    prevturn = global.charturn
    moveswapped = false
    if (global.charturn == 1)
    {
        if (global.charmove[0] == true)
        {
            global.charturn = 0
            moveswapped = true
        }
    }
    if (global.charturn == 2)
    {
        moveswapped = true
        if (global.charmove[1] == true && global.acting[1] == false)
            global.charturn = 1
        else if (global.charmove[0] == true)
            global.charturn = 0
    }
    if (moveswapped == true)
    {
        global.bmenuno = 0
        if (global.char[global.charturn] == 4)
        {
            with (obj_monsterparent)
                actingnoe = false
        }
        if (global.char[global.charturn] == 3)
        {
            with (obj_monsterparent)
                actingral = false
        }
        if (global.char[global.charturn] == 2)
        {
            with (obj_monsterparent)
                actingsus = false
        }
        global.actingsingle[global.charturn] = false
        global.actingsimul[global.charturn] = false
        global.faceaction[global.charturn] = 0
        global.chartarget[global.charturn] = 0
        global.charaction[global.charturn] = 0
        global.charspecial[global.charturn] = 0
        movenoise = true
    }
    if (global.charturn == 0)
    {
        with (obj_monsterparent)
            acting = false
        global.acting[0] = false
        global.acting[1] = false
        global.acting[2] = false
        global.faceaction[1] = 0
        global.chartarget[1] = 0
        global.charaction[1] = 0
        global.charspecial[1] = 0
        global.faceaction[2] = 0
        global.tension = global.temptension[0]
        for (i = 0; i < 12; i += 1)
            tempitem[i][0] = global.item[i]
    }
    else
    {
        global.tension = global.temptension[global.charturn]
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][(global.charturn - 1)]
    }
    return;
}

function scr_oflash() {
    _oflash = instance_create(x, y, obj_oflash)
    _oflash.image_xscale = image_xscale
    _oflash.image_speed = 0
    _oflash.image_index = image_index
    _oflash.image_yscale = image_yscale
    //if (global.chapter == 2 && object_index == obj_mauswheel_enemy)
    //    _oflash.sprite_index = spr_mauswheel_idle
    //else
        _oflash.sprite_index = sprite_index
    _oflash.depth = (depth - 1)
    _oflash.target = id
    return _oflash;
}

function scr_act_charsprite(char, spr, spd, animtype) {
    _charactor = argument0
    _charinstance = obj_herokris
    if (_charactor == "noelle")
    {
        _charinstance = obj_heronoelle
        _charnum = 4
    }
    if (_charactor == "ralsei")
    {
        _charinstance = obj_heroralsei
        _charnum = 3
    }
    if (_charactor == "susie")
    {
        _charinstance = obj_herosusie
        _charnum = 2
    }
    if (_charactor == "kris")
    {
        _charinstance = obj_herokris
        _charnum = 1
    }
    __returnvalue = _charactsprite[_charnum]
    if i_ex(_charinstance)
    {
        with (_charinstance)
        {
            image_alpha = 0
            state = 0
            global.faceaction[myself] = 0
        }
        _charactsprite[_charnum] = scr_dark_marker(_charinstance.x, _charinstance.y, argument1)
        with (_charactsprite[_charnum])
        {
            depth = (20 - (__view_get((1 << 0), 0) / 40))
            scr_oflash()
            if (argument2 > 0 && argument3 == 0)
                scr_animate(0, 0, argument2)
            if (argument2 > 0 && argument3 == 1)
                image_speed = argument2
            a = scr_afterimage()
            a.hspeed = 2.5
            a.depth = (depth + 1)
            b = scr_afterimage()
            b.image_alpha = 0.6
            b.hspeed = 5
            b.depth = (depth + 2)
        }
        __returnvalue = _charactsprite[_charnum]
    }
    return __returnvalue;
}


