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

