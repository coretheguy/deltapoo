function scr_bullet_init() {
    grazed = false
    grazetimer = 0
    destroyonhit = true
    target = 0
    inv = 60
    damage = 10
    element = 0
    grazepoints = 1
    timepoints = 1
    active = true
    updateimageangle = 0
    return;
}

function scr_bullet_inherit(bullet) {
    if i_ex(argument0)
    {
        if (damage != -1)
            argument0.damage = damage
        if (grazepoints != -1)
            argument0.grazepoints = grazepoints
        if (timepoints != -1)
            argument0.timepoints = timepoints
        if (inv != -1)
            argument0.inv = inv
        if (target != -1)
            argument0.target = target
        if (grazed != -1)
            argument0.grazed = false
        if (grazetimer != -1)
            argument0.grazetimer = 0
        argument0.element = element
    }
    return;
}

function scr_childbullet(xx, yy, obj) {
    __child = instance_create(argument[0], argument[1], argument[2])
    __parent = (argument_count == 4 ? argument[3] : id)
    if (__parent.damage != -1)
        __child.damage = __parent.damage
    if (__parent.grazepoints != -1)
        __child.grazepoints = __parent.grazepoints
    if (__parent.timepoints != -1)
        __child.timepoints = __parent.timepoints
    if (__parent.inv != -1)
        __child.inv = __parent.inv
    if (__parent.target != -1)
        __child.target = __parent.target
    if (__parent.grazed != -1)
        __child.grazed = __parent.grazed
    if (__parent.grazetimer != -1)
        __child.grazetimer = __parent.grazetimer
    __child.element = __parent.element
    return __child;
}



