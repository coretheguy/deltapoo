function scr_litemremove(argument0) {
    for (i = 0; i < 8; i += 1)
    {
        if (global.litem[i] == argument0)
            script_execute(scr_litemshift, i, 0)
    }
    return;
}

function scr_armorremove(argument0) {
    __i = 0
    var loop = 1
    __inventorysize = array_length(global.armor)
    while (loop == 1)
    {
        if (global.armor[__i] == argument0)
        {
            global.armor[__i] = 0
            break
        }
        else if (__i == __inventorysize)
        {
            loop = 0
            break
        }
        else
        {
            __i += 1
            continue
        }
    }
    script_execute(scr_armorinfo_all)
    return;
}

function scr_weaponremove(argument0) {
    __i = 0
    __loop = 1
    __inventorysize = array_length(global.weapon)
    while (__loop == 1)
    {
        if (global.weapon[__i] == argument0)
        {
            global.weapon[__i] = 0
            break
        }
        else if (i == __inventorysize)
        {
            __loop = 0
            break
        }
        else
        {
            __i += 1
            continue
        }
    }
    script_execute(scr_weaponinfo_all)
    return;
}




function scr_keyitemremove(argument0) {
    removed = 0
    scr_keyitemcheck(argument0)
    if (haveit == 1)
    {
        loc = 0
        skip = 0
        if (global.keyitem[0] == argument0 && skip == 0)
        {
            loc = 0
            skip = 1
        }
        if (global.keyitem[1] == argument0 && skip == 0)
        {
            loc = 1
            skip = 1
        }
        if (global.keyitem[2] == argument0 && skip == 0)
        {
            loc = 2
            skip = 1
        }
        if (global.keyitem[3] == argument0 && skip == 0)
        {
            loc = 3
            skip = 1
        }
        if (global.keyitem[4] == argument0 && skip == 0)
        {
            loc = 4
            skip = 1
        }
        if (global.keyitem[5] == argument0 && skip == 0)
        {
            loc = 5
            skip = 1
        }
        if (global.keyitem[6] == argument0 && skip == 0)
        {
            loc = 6
            skip = 1
        }
        if (global.keyitem[7] == argument0 && skip == 0)
        {
            loc = 7
            skip = 1
        }
        if (global.keyitem[8] == argument0 && skip == 0)
        {
            loc = 8
            skip = 1
        }
        if (global.keyitem[9] == argument0 && skip == 0)
        {
            loc = 9
            skip = 1
        }
        if (global.keyitem[10] == argument0 && skip == 0)
        {
            loc = 10
            skip = 1
        }
        if (global.keyitem[11] == argument0 && skip == 0)
        {
            loc = 11
            skip = 1
        }
        scr_keyitemshift(loc, 0)
        removed = 1
    }
    return;
}



function scr_itemremove(argument0) {
    removed = 0
    scr_itemcheck(argument0)
    if (haveit == 1)
    {
        loc = 0
        skip = 0
        if (global.item[0] == argument0 && skip == 0)
        {
            loc = 0
            skip = 1
        }
        if (global.item[1] == argument0 && skip == 0)
        {
            loc = 1
            skip = 1
        }
        if (global.item[2] == argument0 && skip == 0)
        {
            loc = 2
            skip = 1
        }
        if (global.item[3] == argument0 && skip == 0)
        {
            loc = 3
            skip = 1
        }
        if (global.item[4] == argument0 && skip == 0)
        {
            loc = 4
            skip = 1
        }
        if (global.item[5] == argument0 && skip == 0)
        {
            loc = 5
            skip = 1
        }
        if (global.item[6] == argument0 && skip == 0)
        {
            loc = 6
            skip = 1
        }
        if (global.item[7] == argument0 && skip == 0)
        {
            loc = 7
            skip = 1
        }
        if (global.item[8] == argument0 && skip == 0)
        {
            loc = 8
            skip = 1
        }
        if (global.item[9] == argument0 && skip == 0)
        {
            loc = 9
            skip = 1
        }
        if (global.item[10] == argument0 && skip == 0)
        {
            loc = 10
            skip = 1
        }
        if (global.item[11] == argument0 && skip == 0)
        {
            loc = 11
            skip = 1
        }
        scr_itemshift(loc, 0)
        removed = 1
    }
    return;
}

