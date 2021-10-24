function scr_debug_print(stre) {
    if (!scr_debug())
        return;
    if (!instance_exists(obj_debug_gui))
    {
        instance_create((__view_get(0, 0) + 10), (__view_get(1, 0) + 10), obj_debug_gui)
        obj_debug_gui.depth = -9999
    }
    obj_debug_gui.newtext = argument0
    with (obj_debug_gui)
    {
        message[messagecount] = newtext
        newtext = ""
        timer[messagecount] = (90 - totaltimer)
        totaltimer += timer[messagecount]
        messagecount++
        debugmessage = message[0]
        for (i = 1; i < messagecount; i++)
            debugmessage += ("#" + message[i])
    }
    return;
}

function debug_printline(stri, pos) {
    if scr_debug()
    {
        draw_set_font(fnt_small)
        draw_set_color(c_black)
        yy = (480 - (8 * argument1))
        xx = 2
		draw_text(xx, yy, stri)
        draw_set_color(c_white)
    }
    return;
}

function scr_debug_print_persistent(txt) {
    draw_set_halign(fa_right)
    var dcolor = draw_get_color()
    draw_set_color(c_black)
    draw_text_transformed(621, 11, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_color(dcolor)
    draw_text_transformed(620, 10, string_hash_to_newline(argument0), 0.5, 0.5, 0)
    draw_set_halign(fa_left)
    return;
}


