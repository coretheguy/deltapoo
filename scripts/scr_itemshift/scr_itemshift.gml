function scr_itemshift() {
    global.item[12] = argument1
    for (i = argument0; i < 12; i += 1)
        global.item[i] = global.item[(i + 1)]
    scr_iteminfo_all()
    scr_itemname()
    return;
}


function scr_litemshift() {
    global.litem[8] = argument1
    for (i = argument0; i < 8; i += 1)
        global.litem[i] = global.litem[(i + 1)]
    script_execute(scr_litemname)
    return;
}



function scr_keyitemshift() {
    global.keyitem[12] = argument1
    for (i = argument0; i < 12; i += 1)
        global.keyitem[i] = global.keyitem[(i + 1)]
    scr_keyiteminfo_all()
    return;
}

