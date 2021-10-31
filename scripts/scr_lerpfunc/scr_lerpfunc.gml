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

function scr_lerpvar(_var, _p1, _p2, _maxt, _easet, _easeio) {
    if (argument_count < 6)
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3])
    else
        ___lerpvar = scr_lerpvar_instance(id, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
    return ___lerpvar;
}

