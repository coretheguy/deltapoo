function scr_getboxbounds() {
    if instance_exists(obj_growtangle)
    {
        minx = (obj_growtangle.x - (obj_growtangle.sprite_width / 2))
        maxx = (obj_growtangle.x + (obj_growtangle.sprite_width / 2))
        miny = (obj_growtangle.y - (obj_growtangle.sprite_height / 2))
        maxy = (obj_growtangle.y + (obj_growtangle.sprite_height / 2))
    }
    else
    {
        minx = 999
        maxx = 999
        miny = 999
        maxy = 999
    }
    return;
}

function scr_drawinbox(x1, y1, x2, y2) {
    var _boxleft = (argument0 - (argument2 / 2))
    var _boxtop = (argument1 - (argument3 / 2))
    var _xx = ((_boxleft - (x - sprite_xoffset)) + 1)
    var _yy = ((_boxtop - (y - sprite_yoffset)) + 1)
    draw_sprite_part_ext(sprite_index, image_index, _xx, _yy, argument2, argument3, (_boxleft + 1), (_boxtop + 1), sign(image_xscale), sign(image_yscale), image_blend, image_alpha)
    return;
}

function scr_drawinbulletbox() {
    scr_drawinbox(obj_growtangle.x, obj_growtangle.y, (obj_growtangle.sprite_width - 8), (obj_growtangle.sprite_height - 8))
    return;
}

