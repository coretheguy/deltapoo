function scr_emote() {
    __dmult = (1 + global.darkzone)
    __emotebubble = instance_create(x, (y - 15), obj_excblcon)
    __emotebubble.alarm[0] = argument[1]
    __emotebubble.image_xscale = __dmult
    __emotebubble.image_yscale = __dmult
    __emotexoff = 0
    __anchorx = sprite_get_xoffset(sprite_index)
    if (argument[0] == "!")
    {
        __emotebubble.sprite_index = spr_exc
        __emotebubble.y = (y - (10 * __dmult))
        __emotexoff = (10 * __dmult)
    }
    if (argument[0] == "?")
    {
        __emotebubble.sprite_index = spr_emote_questionmark
        __emotebubble.y = (y - (10 * __dmult))
        __emotexoff = (10 * __dmult)
    }
    if (argument[0] == "...")
    {
        __emotebubble.sprite_index = spr_emote_ellipsis
        __emotebubble.y = (y - (10 * __dmult))
        __emotexoff = (10 * __dmult)
    }
    if (argument_count >= 3)
        __emotexoff = argument[2]
    if (image_xscale > 0)
        __emotebubble.x = ((((x - (__anchorx * image_xscale)) + ((sprite_width / 2) * sign(image_xscale))) - (__emotebubble.sprite_width / 2)) + __emotexoff)
    else
        __emotebubble.x = ((((x + (__anchorx * image_xscale)) - ((sprite_width / 2) * sign(image_xscale))) - (__emotebubble.sprite_width / 2)) + __emotexoff)
    return;
}

function scr_lerpvar_instance(targ, varn, pa, pb, maxt, easet, easeio) {
    __lerpvar = instance_create(0, 0, obj_lerpvar)
    __lerpvar.target = argument[0]
    __lerpvar.varname = argument[1]
    __lerpvar.pointa = argument[2]
    __lerpvar.pointb = argument[3]
    __lerpvar.maxtime = argument[4]
    if (argument_count >= 6)
        __lerpvar.easetype = argument[5]
    if (argument_count >= 7)
        __lerpvar.easeinout = argument[6]
    return __lerpvar;
}

function scr_script_repeat() {
    var __scriptdelay = instance_create(0, 0, obj_script_delayed)
    __scriptdelay.script = argument[0]
    __scriptdelay.alarm[0] = -2
    __scriptdelay.max_time = argument[1]
    __scriptdelay.rate = argument[2]
    __scriptdelay.constant = 1
    __scriptdelay.target = id
    for (var __i = 0; __i < (argument_count - 3); __i++)
        __scriptdelay.script_arg[__i] = argument[(__i + 3)]
    __scriptdelay.arg_count = (argument_count - 3)
    return __scriptdelay;
}

function scr_actor_facing(actor, face) {
    __newfacing = argument1
    argument0.facing = __newfacing
    if (__newfacing == "d")
        argument0.sprite_index = argument0.dsprite
    if (__newfacing == "r")
        argument0.sprite_index = argument0.rsprite
    if (__newfacing == "l")
        argument0.sprite_index = argument0.lsprite
    if (__newfacing == "u")
        argument0.sprite_index = argument0.usprite
    return;
}

function scr_halt() {
    image_index = 0
    image_speed = 0
    speed = 0
    return;
}

function scr_flip(dir) {
    if (argument0 == "h" || argument0 == "x")
    {
        x += ((sprite_get_width(sprite_index) - (sprite_get_xoffset(sprite_index) * 2)) * image_xscale)
        image_xscale = (-image_xscale)
    }
    else
    {
        y += ((sprite_get_height(sprite_index) - (sprite_get_yoffset(sprite_index) * 2)) * image_yscale)
        image_yscale = (-image_yscale)
    }
    return;
}

function scr_stickto(obj, depth) {
    _stickto = instance_create(0, 0, obj_stickto)
    _stickto.stickingobj = id
    _stickto.stucktoobj = argument0
    _stickto.relativedepth = argument1
    with (_stickto)
        event_user(0)
    return;
}

function scr_stickto_stop() {
    if variable_instance_exists(id, "_stickto")
    {
        with (_stickto)
            instance_destroy()
    }
    return;
}

function scr_animate(inframe, enframe, spd) {
    __animator = instance_create(x, y, obj_animator)
    __animator.target = id
    __animator.initframe = argument0
    __animator.endframe = argument1
    __animator.fake_image_speed = argument2
    return __animator;
}

function scr_shakeobj() {
    shakeobj = instance_create(x, y, obj_shakeobj)
    shakeobj.target = id
    with (shakeobj)
        event_user(0)
    return;
}

function scr_jump_to_point_sprite(ex, ey, jspd, jtm, jspr, lspr) {
    __jump_to_point = instance_create(x, y, obj_jump_to_point)
    __jump_to_point.target = id
    with (__jump_to_point)
    {
        startx = x
        starty = y
        endx = argument0
        endy = argument1
        jumpspeed = argument2
        jumptime = argument3
        jumpsprite = argument4
        landsprite = argument5
        if (argument4 > 0)
            usesprites = 1
        drawshadow = false
    }
    return __jump_to_point;
}

function scr_jump_in_place(jspd, jtm) {
    scr_jump_to_point(x, y, argument0, argument1)
    return;
}


function scr_jump_to_point(ex, ey, jspd, jtm) {
    return scr_jump_to_point_sprite(argument0, argument1, argument2, argument3, 0, 0);
}

function scr_fadeout(spd) {
    __fadeouter = instance_create((camerax() - 200), (cameray() - 200), obj_fadeout)
    __fadeouter.fadespeed = (1 / argument0)
    __fadeouter.depth = 3
    return __fadeouter;
}






