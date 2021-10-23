function scr_enemy_drawidle_generic(sine) {
    if (state == 0)
    {
        fsiner += 1
        siner += argument0
        thissprite = idlesprite
        if (global.mercymod[myself] >= global.mercymax[myself])
            thissprite = sparedsprite
        draw_monster_body_part(thissprite, siner, x, y)
    }
    return;
}

function scr_enemy_drawhurt_generic() {
    hurttimer -= 1
    if (hurttimer < 0)
        state = 0
    else
    {
        if (global.monster[myself] == false)
            scr_defeatrun()
        hurtshake += 1
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1
            if (shakex < 0)
                shakex += 1
            shakex = (-shakex)
            hurtshake = 0
        }
        draw_sprite_ext(hurtsprite, 0, ((x + shakex) + hurtspriteoffx), (y + hurtspriteoffy), 2, 2, 0, image_blend, 1)
    }
    return;
}



function draw_monster_body_part(spr, ind, xx, yy) {
    draw_sprite_ext(argument0, argument1, argument2, argument3, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if (flash == true)
        draw_sprite_ext_flash(argument0, argument1, argument2, argument3, image_xscale, image_yscale, image_angle, image_blend, (((-cos((fsiner / 5))) * 0.4) + 0.6))
    return;
}

function draw_sprite_ext_flash(spr, ind, xx, yy, xscale, yscale, rot, col, alp) {
    d3d_set_fog(true, argument7, 0, 1)
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    d3d_set_fog(false, c_black, 0, 0)
    return;
}

function draw_monster_body_part_ext(spr, ind, xx, yy, xscale, yscale, angle, blend, alpha) {
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    if (flash == true)
        draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, (((-cos((fsiner / 5))) * 0.4) + 0.6))
    return;
}

