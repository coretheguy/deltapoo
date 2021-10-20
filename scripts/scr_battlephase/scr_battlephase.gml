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



