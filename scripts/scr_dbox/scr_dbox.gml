function scr_dbox() {
    xxx = __view_get((0 << 0), 0)
    yyy = __view_get((1 << 0), 0)
    if (global.darkzone == 0)
    {
        if (side == 0)
        {
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 5), (xxx + 304), (yyy + 80), false)
            draw_set_color(c_black)
            draw_rectangle((xxx + 19), (yyy + 8), (xxx + 301), (yyy + 77), false)
        }
        else
        {
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 160), (xxx + 304), (yyy + 235), false)
            draw_set_color(c_black)
            draw_rectangle((xxx + 19), (yyy + 163), (xxx + 301), (yyy + 232), false)
        }
    }
    if (global.darkzone == 1)
    {
        if (side == 0)
        {
            draw_set_color(c_black)
            draw_rectangle((xxx + 38), (yyy + 16), (xxx + 602), (yyy + 154), false)
            scr_darkbox(((xxx + 32) - 8), ((yyy + 10) - 8), ((xxx + 608) + 8), ((yyy + 160) + 8))
        }
        else
        {
            draw_set_color(c_black)
            draw_rectangle((xxx + 38), (yyy + 326), (xxx + 602), (yyy + 464), false)
            scr_darkbox(((xxx + 32) - 8), ((yyy + 320) - 8), ((xxx + 608) + 8), ((yyy + 470) + 8))
        }
    }
    return;
}

function scr_darkbox(argument0, argument1, argument2, argument3) {
    cur_jewel += 1
    textbox_width = ((argument2 - argument0) - 63)
    if (textbox_width < 0)
        textbox_width = 0
    textbox_height = ((argument3 - argument1) - 63)
    if (textbox_height < 0)
        textbox_height = 0
    if (textbox_width > 0)
    {
        draw_sprite_stretched(spr_textbox_top, 0, (argument0 + 32), argument1, textbox_width, 32)
        draw_sprite_ext(spr_textbox_top, 0, (argument0 + 32), (argument3 + 1), textbox_width, -2, 0, c_white, 1)
    }
    if (textbox_height > 0)
    {
        draw_sprite_ext(spr_textbox_left, 0, (argument2 + 1), (argument1 + 32), -2, textbox_height, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_left, 0, argument0, (argument1 + 32), 2, textbox_height, 0, c_white, 1)
    }
    if (global.flag[8] == 0)
    {
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), argument0, argument1, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), (argument2 + 1), argument1, -2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), argument0, (argument3 + 1), 2, -2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), (argument2 + 1), (argument3 + 1), -2, -2, 0, c_white, 1)
    }
    else
    {
        draw_sprite_ext(spr_textbox_topleft, 0, argument0, argument1, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, (argument2 + 1), argument1, -2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, argument0, (argument3 + 1), 2, -2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, (argument2 + 1), (argument3 + 1), -2, -2, 0, c_white, 1)
    }
    return;
}



