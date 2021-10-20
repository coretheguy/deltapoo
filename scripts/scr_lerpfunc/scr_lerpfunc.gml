function lerp_ease_out(pos1, pos2, _v, _t) {
    return lerp(argument0, argument1, scr_ease_out(argument2, argument3));
}

function lerp_ease_in(pos1, pos2, _v, _t) {
    return lerp(argument0, argument1, scr_ease_in(argument2, argument3));
}

function lerp_ease_inout(pos1, pos2, _v, _t) {
    return lerp(argument0, argument1, scr_ease_inout(argument2, argument3));
}

function scr_inverselerp(pos1, pos2, time) {
    if (argument1 == argument0)
        return 0;
    return ((argument2 - argument0) / (argument1 - argument0));
}

