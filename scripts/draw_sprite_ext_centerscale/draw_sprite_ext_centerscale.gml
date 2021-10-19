function draw_sprite_ext_centerscale(_spr, _ind, _x, _y, _xscale, _yscale, _rot, _col, _alpha) {
    var _xoff = (sprite_get_xoffset(argument0) * image_xscale)
    var _yoff = (sprite_get_yoffset(argument0) * image_yscale)
    var _sprite_width = (sprite_get_width(argument0) * image_xscale)
    var _sprite_height = (sprite_get_width(argument0) * image_yscale)
    draw_sprite_ext(argument0, argument1, (argument2 - (((_sprite_width - _xoff) * (argument4 - image_xscale)) / 2)), (argument3 - (((_sprite_height - _yoff) * (argument5 - image_yscale)) / 2)), argument4, argument5, argument6, argument7, argument8)
    return;
}

function scr_draw_outline_ext(_spr, _ind, _x, _y, _xscale, _yscale, _rot, _ocol, _alpha, _othi) {
    gpu_set_fog(true, argument7, 0, 0)
    var __xdirA = argument9
    var __xdirB = 0
    var __ydirA = 0
    var __ydirB = argument9
    if ((argument6 % 90) != 0)
    {
        __xdirA = lengthdir_x(argument9, argument6)
        __xdirB = lengthdir_x(argument9, (argument6 + 90))
        __ydirA = lengthdir_y(argument9, (argument6 + 90))
        __ydirB = lengthdir_y(argument9, argument6)
    }
    draw_sprite_ext(argument0, argument1, (argument2 + __xdirA), (argument3 + __ydirA), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 - __xdirA), (argument3 - __ydirA), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 + __xdirB), (argument3 + __ydirB), argument4, argument5, argument6, c_white, argument8)
    draw_sprite_ext(argument0, argument1, (argument2 - __xdirB), (argument3 - __ydirB), argument4, argument5, argument6, c_white, argument8)
    gpu_set_fog(false, c_white, 0, 0)
    return;
}

