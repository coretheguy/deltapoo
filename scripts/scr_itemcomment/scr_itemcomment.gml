function scr_itemcomment() {
    talkx = scr_charbox_x(argument0)
    itemcomment = instance_create((talkx + xx), (yy + 460), obj_menuwriter)
    itemcomment.msg = argument1
    itemcomment.who = argument0
    if (global.flag[32] == 1)
    {
        with (itemcomment)
            instance_destroy()
    }
    return;
}


function scr_dmenu_armor_selection_match() {
    if (global.submenu == 13 && global.submenucoord[14] != global.submenucoord[13])
        global.submenucoord[14] = global.submenucoord[13]
    if (global.submenu == 14 && global.submenucoord[13] != global.submenucoord[14])
        global.submenucoord[13] = global.submenucoord[14]
    return;
}

