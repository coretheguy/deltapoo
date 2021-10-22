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

function scr_itemcheck_inventory_and_pocket(item) {
    var _haveeither = false
    var itemcounttotal = 0
    scr_itemcheck(argument0)
    if (haveit == true)
        _haveeither = true
    itemcounttotal += itemcount
    scr_itemcheck_pocket(argument0)
    if (haveit == true)
        _haveeither = 1
    itemcounttotal += itemcount
    haveit = _haveeither
    itemcount = itemcounttotal
    return haveit;
}



function scr_itemcheck_pocket(argument0) {
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

function scr_armorcheck_equipped(char, armor) {
    var __wearing = 0
    if (global.chararmor1[argument0] == argument1)
        __wearing++
    if (global.chararmor2[argument0] == argument1)
        __wearing++
    return __wearing;
}

function scr_armorcheck_inventory(armor) {
    haveit = false
    itemcount = 0
    for (i = 0; i < 48; i += 1)
    {
        if (global.armor[i] == argument0)
            haveit = true
        if (global.armor[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

function scr_weaponcheck_inventory(weapon) {
    haveit = false
    itemcount = 0
    for (i = 0; i < 48; i += 1)
    {
        if (global.weapon[i] == argument0)
            haveit = true
        if (global.weapon[i] == argument0)
            itemcount += 1
    }
    return haveit;
}

