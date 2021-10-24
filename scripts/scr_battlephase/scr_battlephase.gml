function scr_isphase(phase) {
    __isphase = 0
    if (argument0 == "menu" && global.myfight == 0)
        __isphase = 1
    if (argument0 == "acting" && global.myfight == 3)
        __isphase = 1
    if (argument0 == "victory" && global.myfight == 7)
        __isphase = 1
    if (argument0 == "attack" || argument0 == "fight")
    {
        if (global.myfight == 1)
            __isphase = 1
    }
    if (argument0 == "spell" || argument0 == "item")
    {
        if (global.myfight == 4)
            __isphase = 1
    }
    if (argument0 == "enemytalk" || argument0 == "balloon")
    {
        if (global.mnfight == 1)
            __isphase = 1
    }
    if (argument0 == "enemyattack" || argument0 == "bullets")
    {
        if (global.mnfight == 2)
            __isphase = 1
    }
    return __isphase;
}

function scr_battletext() {
    xx = __view_get(0, 0)
    yy = __view_get(1, 0)
    if (global.fc != 0)
        battlewriter = instance_create((xx + 30), (yy + 376), obj_writer)
    if (global.fc == 0)
        battlewriter = instance_create((xx + 30), (yy + 376), obj_writer)
    myface = instance_create((xx + 26), (yy + 380), obj_face)
    with (battlewriter)
    {
        dialoguer = 1
        facer = 1
        if (global.fc == 0 && originalcharline == 33)
            charline = 26
    }
    return battlewriter;
}


function scr_attack_override(att, amt, en) {
    var __attackdebug = argument0
    if (argument1 > 10)
        argument1 = 10
    if (keyboard_check_pressed(vk_decimal) || keyboard_check_pressed(ord("½")))
    {
        __attackdebug = -1
        scr_debug_print((argument2 + " attack randomized."))
    }
    else
    {
        for (i = 0; i < argument1; i++)
        {
            if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed((vk_numpad0 + i)))
                __attackdebug = i
        }
        for (i = argument1; i < 10; i++)
        {
            if (keyboard_check_pressed(ord(string(i))) || keyboard_check_pressed((vk_numpad0 + i)))
                scr_debug_print(((argument2 + " does not have an attack no. ") + string(i)))
        }
    }
    if (__attackdebug != argument0 && __attackdebug > -1)
        scr_debug_print(((argument2 + " attack set to no. ") + string(__attackdebug)))
    if keyboard_check_pressed(vk_tab)
    {
        if (window_get_height() == 480)
        {
            var __screensize = floor((display_get_height() / 480))
            window_set_size((640 * __screensize), (480 * __screensize))
        }
        else
            window_set_size(640, 480)
    }
    return __attackdebug;
}


