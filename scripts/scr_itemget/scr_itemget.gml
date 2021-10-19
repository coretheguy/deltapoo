function scr_itemget() {
    var __i = 0
    var loop = true
    noroom = false
    _pocketed = false
    _noroominventory = false
    global.item[12] = 999
    while (loop == true)
    {
        if (global.item[__i] == 0)
        {
            global.item[__i] = argument0
            break
        }
        else if (__i == 12)
        {
            _noroominventory = true
            noroom = true
            var __j = 0
            while (__j < global.flag[64])
            {
                if (global.pocketitem[__j] == 0)
                {
                    debug_message(("Placed in pocket :" + string(__j)))
                    global.pocketitem[__j] = argument0
                    _pocketed = true
                    noroom = false
                    break
                }
                else
                {
                    __j++
                    continue
                }
            }
            break
        }
        else
        {
            __i += 1
            continue
        }
    }
    script_execute(scr_iteminfo_all)
    debug_message(("noroom=" + string(noroom)))
    debug_message(("_pocketed=" + string(_pocketed)))
    debug_message(("_noroominventory=" + string(_noroominventory)))
    return;
}



function scr_litemget(item) {
    i = 0
    loop = true
    noroom = false
    global.litem[8] = 999
    while (loop == true)
    {
        if (global.litem[i] == 0)
        {
            global.litem[i] = argument0
            break
        }
        else if (i == 8)
        {
            noroom = true
            break
        }
        else
        {
            i += 1
            continue
        }
    }
    scr_litemname()
    return;
}

function scr_keyitemget(item) {
    i = 0
    loop = true
    noroom = false
    global.item[12] = 999
    while (loop == true)
    {
        if (global.keyitem[i] == 0)
        {
            global.keyitem[i] = argument0
            break
        }
        else if (i == 12)
        {
            noroom = true
            break
        }
        else
        {
            i += 1
            continue
        }
    }
    script_execute(scr_keyiteminfo_all)
    return;
}

