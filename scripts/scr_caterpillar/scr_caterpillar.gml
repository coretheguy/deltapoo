function scr_caterpillar_interpolate() {
    _newfacing = scr_facing_letter_to_number(scr_get_cardinal_direction(point_direction(x, y, obj_mainchara.x, obj_mainchara.y)))
    remx[0] = obj_mainchara.x
    remy[0] = obj_mainchara.y
    facing[0] = _newfacing
    for (_iaia = target; _iaia > 0; _iaia -= 1)
    {
        remx[_iaia] = lerp(obj_mainchara.x, x, (_iaia / target))
        if (global.darkzone == true)
            remy[_iaia] = lerp(obj_mainchara.y, (y + 16), (_iaia / target))
        else
            remy[_iaia] = lerp(obj_mainchara.y, (y + 6), (_iaia / target))
        facing[_iaia] = _newfacing
    }
    return;
}

function scr_unmarkify_caterpillar() {
    for (i = 0; i < 2; i += 1)
    {
        if i_ex(global.cinstance[i])
        {
            if (global.char[(i + 1)] == 2)
            {
                if (global.cinstance[i].x != s.x || global.cinstance[i].y != s.x)
                {
                    global.cinstance[i].x = s.x
                    global.cinstance[i].y = (s.y + 10)
                    with (global.cinstance[i])
                        scr_caterpillar_interpolate()
                    global.cinstance[i].y -= 10
                }
                with (global.cinstance[i])
                {
                    if (global.facing == 0)
                        sprite_index = dsprite
                    if (global.facing == 1)
                        sprite_index = rsprite
                    if (global.facing == 2)
                        sprite_index = usprite
                    if (global.facing == 3)
                        sprite_index = lsprite
                    visible = true
                }
                with (s)
                    instance_destroy()
            }
            if (global.char[(i + 1)] == 3)
            {
                if (global.cinstance[i].x != r.x || global.cinstance[i].y != r.x)
                {
                    global.cinstance[i].x = r.x
                    global.cinstance[i].y = (r.y + 10)
                    with (global.cinstance[i])
                        scr_caterpillar_interpolate()
                    global.cinstance[i].y -= 10
                }
                with (global.cinstance[i])
                {
                    if (global.facing == 0)
                        sprite_index = dsprite
                    if (global.facing == 1)
                        sprite_index = rsprite
                    if (global.facing == 2)
                        sprite_index = usprite
                    if (global.facing == 3)
                        sprite_index = lsprite
                    visible = true
                }
                with (r)
                    instance_destroy()
            }
        }
    }
    return;
}

function scr_markify_caterpillar() {
    s = 4378473
    r = 4387437
    for (i = 0; i < 2; i += 1)
    {
        if i_ex(global.cinstance[i])
        {
            if (global.char[(i + 1)] == 2)
            {
                s = scr_dark_marker(global.cinstance[i].x, global.cinstance[i].y, global.cinstance[i].sprite_index)
                with (global.cinstance[i])
                    visible = false
            }
            if (global.char[(i + 1)] == 3)
            {
                r = scr_dark_marker(global.cinstance[i].x, global.cinstance[i].y, global.cinstance[i].sprite_index)
                with (global.cinstance[i])
                    visible = false
            }
        }
    }
    return;
}

function scr_caterpillar_facing(dir) {
    with (obj_caterpillarchara)
    {
        for (i = 0; i < 25; i += 1)
            facing[i] = argument0
    }
    return;
}

function scr_caterpillar_facing_single(char, dir) {
    with (obj_caterpillarchara)
    {
        if (name == argument0)
        {
            for (i = 0; i < 25; i += 1)
                facing[i] = scr_facing_letter_to_number(argument1)
        }
    }
    return;
}

function scr_makecaterpillar(x, y, name, inst) {
	
    global.cinstance[argument3] = instance_create(argument0, argument1, obj_caterpillarchara)
    global.cinstance[argument3].target = (12 + (argument3 * 12))
    if (argument2 == 3)
    {
        with (global.cinstance[argument3])
        {
            usprite = spr_ralseiu
            dsprite = spr_ralseid
            rsprite = spr_ralseir
            lsprite = spr_ralseil
            if (global.chapter >= 2)
            {
                name = "ralsei"
                usprite = spr_ralsei_walk_up
                dsprite = spr_ralsei_walk_down
                rsprite = spr_ralsei_walk_right
                lsprite = spr_ralsei_walk_left
            }
        }
    }
    if (argument2 == 4)
    {
        with (global.cinstance[argument3])
        {
            name = "noelle"
            usprite = spr_noelle_walk_up_dw
            dsprite = spr_noelle_walk_down_dw
            rsprite = spr_noelle_walk_right_dw
            lsprite = spr_noelle_walk_left_dw
            if (global.chapter == 2 && global.plot == 95)
            {
                dsprite = spr_noelle_walk_down_blush_dw
                rsprite = spr_noelle_walk_right_blush_dw
                lsprite = spr_noelle_walk_left_blush_dw
            }
			
			if global.darkzone = false {
				
				usprite = spr_noelle_walk_up_lw
				dsprite = spr_noelle_walk_down_lw
				rsprite = spr_noelle_walk_right_lw
				lsprite = spr_noelle_walk_left_lw
			}
        }
    }
    if (argument2 == 5)
    {
        with (global.cinstance[argument3])
        {
            name = "berdly"
            usprite = spr_berdly_walk_up_dw
            dsprite = spr_berdly_walk_down_dw
            rsprite = spr_berdly_walk_right_dw
            lsprite = spr_berdly_walk_left_dw
			
			if global.darkzone = false {
				
				usprite = spr_berdly_walk_up_lw
	            dsprite = spr_berdly_walk_down_lw
	            rsprite = spr_berdly_walk_right_lw
	            lsprite = spr_berdly_walk_left_lw
				
			}
        }
    }
    if (argument2 == 6)
    {
        with (global.cinstance[argument3])
        {
            name = "starwalker"
            usprite = spr_npc_original_starwalker
            dsprite = spr_npc_original_starwalker
            rsprite = spr_npc_original_starwalker
            lsprite = spr_npc_original_starwalker
        }
    }
	if argument2 = 7 {
		
		with global.cinstance[argument3] {
			
			name = "queen"
			usprite = spr_queen_walk_up
			dsprite = spr_queen_walk_down
            rsprite = spr_queen_walk_right
            lsprite = spr_queen_walk_left
		}
	}
	
	if argument2 = 8 {
		
		with global.cinstance[argument3] {
			
			name = "spamton"
			usprite = spr_spamton_party_l
			dsprite = spr_spamton_party_l
            rsprite = spr_spamton_party_l
            lsprite = spr_spamton_party_l
		}
	}
	
    return global.cinstance[argument3];
}
