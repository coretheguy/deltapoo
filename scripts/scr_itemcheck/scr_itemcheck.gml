function scr_litemcheck(argument0) {
    haveit = 0
    itemcount = 0
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == argument0)
            haveit = 1
        if (global.litem[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

function scr_itemcheck(argument0) {
    haveit = 0
    itemcount = 0
    for (var __i = 0; __i < 12; __i += 1)
    {
        if (global.item[__i] == argument0)
            haveit = 1
        if (global.item[__i] == argument0)
            itemcount += 1
    }
    return haveit;
}

function scr_pocketitemcheck(argument0) {
    haveit = 0
    itemcount = 0
    for (var __i = 0; __i < global.flag[64]; __i += 1)
    {
        if (global.pocketitem[__i] == argument0)
            haveit = 1
        if (global.pocketitem[__i] == argument0)
            itemcount += 1
    }
    return haveit;
}

function scr_keyitemcheck(argument0) {
    haveit = 0
    itemcount = 0
    for (i = 0; i < 12; i += 1)
    {
        if (global.keyitem[i] == argument0)
            haveit = 1
        if (global.keyitem[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

