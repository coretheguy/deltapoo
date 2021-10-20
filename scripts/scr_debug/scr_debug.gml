function scr_debug() {
    if (global.debug == 1)
        return 1;
    return;
}

function scr_debug_keycheck(_kp) {
    var key = argument0
    var is_pressed = 0
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var alt_key = -4
        switch key
        {
            case vk_f2:
                alt_key = gp_padu
                break
            case vk_f3:
                alt_key = gp_padr
                break
            case vk_f5:
                alt_key = gp_padd
                break
            case vk_f6:
                alt_key = gp_padl
                break
            case vk_f8:
                alt_key = gp_shoulderl
                break
            case vk_f9:
                alt_key = gp_shoulderlb
                break
            case vk_f10:
                alt_key = gp_shoulderr
                break
            case 86:
                alt_key = gp_select
                break
        }

        if gamepad_button_check(obj_gamecontroller.gamepad_id, gp_shoulderrb)
        {
            if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, alt_key)
                is_pressed = 1
        }
    }
    if ((!is_pressed) && (!global.is_console))
    {
        if keyboard_check_pressed(argument0)
            is_pressed = 1
    }
    return is_pressed;
}

function scr_turn_skip() {
    if (scr_debug && scr_debug_keycheck(ord("V")) && global.turntimer > 0 && instance_exists(obj_growtangle) && scr_isphase("bullets"))
    {
        global.turntimer = 0
        scr_debug_print("Attack skipped")
    }
    return;
}


