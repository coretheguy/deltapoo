function scr_depth() {
    depth = (100000 - ((y * 10) + (sprite_height * 10)))
    return;
}

function scr_depth_alt() {
    depth = (100000 - ((y * 10) + ((sprite_height - sprite_yoffset) * 10)))
    return;
}

