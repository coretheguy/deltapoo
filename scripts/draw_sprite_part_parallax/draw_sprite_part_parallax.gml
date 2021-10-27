function draw_sprite_part_parallax(spr, ind, xoff, yoff, alpha) {
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0)
        _xoffset += _mywidth
    if (_yoffset < 0)
        _yoffset += _myheight
    if (_xoffset == 0 && _yoffset == 0)
        draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4)
    else
    {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_mywidth - _xoffset), (_myheight - _yoffset), (x + (_xoffset * 2)), (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), _xoffset, _yoffset, x, y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_myheight - _yoffset), (_mywidth - _xoffset), _yoffset, (x + (_xoffset * 2)), y, 2, 2, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), 0, _xoffset, (_myheight - _yoffset), x, (y + (_yoffset * 2)), 2, 2, image_blend, argument4)
    }
    return;
}

function draw_sprite_part_parallax_scale(spr, ind, xoff, yoff, alpha, scale) {
    var _scale = argument5
    var _mysprite = argument0
    var _mywidth = sprite_get_width(argument0)
    var _myheight = sprite_get_height(argument0)
    var _xoffset = (argument2 % _mywidth)
    var _yoffset = (argument3 % _myheight)
    if (_xoffset < 0)
        _xoffset += _mywidth
    if (_yoffset < 0)
        _yoffset += _myheight
    var _xmax = (_mywidth * (2 / _scale))
    var _ymax = (_myheight * (2 / _scale))
    if (_xoffset == 0 && _yoffset == 0)
        draw_sprite_ext(argument0, argument1, x, y, 2, 2, 0, image_blend, argument4)
    else
    {
        draw_sprite_part_ext(argument0, argument1, 0, 0, (_xmax - _xoffset), (_ymax - _yoffset), (x + (_xoffset * _scale)), (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_mywidth - _xoffset), (_myheight - _yoffset), min(_xmax, _xoffset), min(_ymax, _yoffset), x, y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, 0, (_ymax - _yoffset), min(_xmax, (_xmax - _xoffset)), min(_ymax, _yoffset), (x + (_xoffset * _scale)), y, _scale, _scale, image_blend, argument4)
        draw_sprite_part_ext(argument0, argument1, (_xmax - _xoffset), 0, min(_xmax, _xoffset), min(_ymax, (_ymax - _yoffset)), x, (y + (_yoffset * _scale)), _scale, _scale, image_blend, argument4)
    }
    return;
}

function scr_drawpart_crop(l, t, r, b) {
    var _true_xanchor = (x - abs(sprite_xoffset))
    var _true_yanchor = (y - abs(sprite_yoffset))
    if (_true_xanchor > argument0 && (_true_xanchor + sprite_width) < argument2 && _true_yanchor > argument1 && (_true_yanchor + sprite_height) < argument3)
    {
        draw_self()
        return;
    }
    var _leftcrop = clamp((argument0 - _true_xanchor), 0, abs(sprite_width))
    var _topcrop = clamp((argument1 - _true_yanchor), 0, abs(sprite_height))
    var _rightcrop = clamp((argument2 - _true_xanchor), 0, abs(sprite_width))
    var _bottomcrop = clamp((argument3 - _true_yanchor), 0, abs(sprite_height))
    draw_sprite_part_ext(sprite_index, image_index, _leftcrop, _topcrop, _rightcrop, _bottomcrop, ((x - sprite_xoffset) + _leftcrop), ((y - sprite_yoffset) + _topcrop), image_xscale, image_yscale, image_blend, image_alpha)
    return;
}

function draw_text_width(xx, yy, str, wid) {
    var _stringxscale = 1
    var _stringwidth = string_width(argument2)
    if (_stringwidth >= argument3)
        _stringxscale = (argument3 / _stringwidth)
    draw_text_transformed(argument0, argument1, argument2, _stringxscale, 1, 0)
    return;
}

function draw_text_shadow_width(xx, yy, str, wid) {
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text_width((argument0 + 1), (argument1 + 1), string_hash_to_newline(argument2), argument3)
    draw_set_color(__txtcolor__)
    draw_text_width(argument0, argument1, string_hash_to_newline(argument2), argument3)
    return;
}



