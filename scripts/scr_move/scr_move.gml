function scr_move_to_point_over_time(_x, _y, _max) {
    _mmm = instance_create(x, y, obj_move_to_point)
    _mmm.target = id
    _mmm.movex = argument0
    _mmm.movey = argument1
    _mmm.movemax = argument2
    return _mmm;
}

function scr_pan_lerp(_x, _y, _max) {
    panner = instance_create(argument0, argument1, obj_panner)
    panner.panmax = argument2
    panner.type = 1
    return;
}

