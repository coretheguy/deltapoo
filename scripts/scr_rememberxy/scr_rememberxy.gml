function scr_rememberxy() {
    ___myrememberx = x
    ___myremembery = y
    return;
}

function scr_move_to_rememberxy(spd) {
    scr_move_to_point_over_time(___myrememberx, ___myremembery, argument0)
    return;
}

