function button1_p() {
    if global.input_pressed[4]
        return 1;
    else if global.input_pressed[7]
        return 1;
    else if gamepad_button_check_pressed(obj_gamecontroller.gamepad_id, gp_shoulderlb)
    {
        if (!obj_gamecontroller.gamepad_shoulderlb_reassign)
            return 1;
    }
    return;
}

function button2_p() {
    if global.input_pressed[5]
        return 1;
    if global.input_pressed[8]
        return 1;
    return;
}

function button3_p() {
    if global.input_pressed[6]
        return 1;
    if global.input_pressed[9]
        return 1;
    return;
}



function button1_h() {
    if global.input_held[4]
        return 1;
    if global.input_held[7]
        return 1;
    return;
}

function button2_h() {
    if global.input_held[5]
        return 1;
    if global.input_held[8]
        return 1;
    return;
}

function button3_h() {
    if global.input_held[6]
        return 1;
    if global.input_held[9]
        return 1;
    return;
}

function button1_r() {
    if global.input_released[4]
        return 1;
    if global.input_released[7]
        return 1;
    return;
}

function button2_r() {
    if global.input_released[5]
        return 1;
    if global.input_released[8]
        return 1;
    return;
}

function button3_r() {
    if global.input_released[6]
        return 1;
    if global.input_released[9]
        return 1;
    return;
}


function down_p() {
    return global.input_pressed[0];
}

function left_p() {
    return global.input_pressed[3];
}

function right_p() {
    return global.input_pressed[1];
}

function up_p() {
    return global.input_pressed[2];
}



function down_h() {
    return global.input_held[0];
}

function left_h() {
    return global.input_held[3];
}

function right_h() {
    return global.input_held[1];
}

function up_h() {
    return global.input_held[2];
}



function down_r() {
    return global.input_released[0];
}

function left_r() {
    return global.input_released[3];
}

function right_r() {
    return global.input_released[1];
}

function up_r() {
    return global.input_released[2];
}



function scr_controls_default() {
    global.button0 = gp_face1
    global.button1 = gp_face2
    global.button2 = gp_face4
    //if (os_type == os_ps4)
    //{
    //    var os_map = os_get_info()
    //    var ps4_confirm_button = undefined
    //    if (os_map != -1)
    //    {
    //        var mapsize = ds_map_size(os_map)
    //        var key = ds_map_find_first(os_map)
    //        for (var i = 0; i < (mapsize - 1); i++)
    //        {
    //            if (key == "enter_button_assign")
    //                ps4_confirm_button = ds_map_find_value(os_map, key)
    //            else
    //                key = ds_map_find_next(os_map, key)
    //        }
    //        ds_map_destroy(os_map)
    //    }
    //    if (ps4_confirm_button == 0)
    //    {
    //        global.button0 = 32770
    //        global.button1 = 32769
    //    }
    //    else
    //    {
    //        global.button0 = 32769
    //        global.button1 = 32770
    //    }
    //    global.button2 = 32772
    //}
    //else if (os_type == os_switch)
    //{
    //    global.button0 = 32770
    //    global.button1 = 32769
    //    global.button2 = 32772
    //}
    global.default_button0 = global.button0
    global.default_button1 = global.button1
    global.default_button2 = global.button2
    global.input_k[0] = vk_down
    global.input_k[1] = vk_right
    global.input_k[2] = vk_up
    global.input_k[3] = vk_left
    global.input_k[4] = ord("Z")
    global.input_k[5] = ord("X")
    global.input_k[6] = ord("C")
    global.input_k[7] = vk_enter
    global.input_k[8] = vk_shift
    global.input_k[9] = vk_control
    global.input_g[0] = gp_padd
    global.input_g[1] = gp_padr
    global.input_g[2] = gp_padu
    global.input_g[3] = gp_padl
    global.input_g[4] = global.button0
    global.input_g[5] = global.button1
    global.input_g[6] = global.button2
    global.input_g[7] = 999
    global.input_g[8] = 999
    global.input_g[9] = 999
    if (!i_ex(obj_gamecontroller))
        instance_create(0, 0, obj_gamecontroller)
    with (obj_gamecontroller)
        gamepad_shoulderlb_reassign = 0
    return;
}

function scr_get_input_name(input) {
    var _control = "[?]"
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        _control = global.input_g[argument0]
        if (_control == gp_padr)
            return "\\*D  ";
        if (_control == gp_padl)
            return "\\*A  ";
        if (_control == gp_padu)
            return "\\*W  ";
        if (_control == gp_padd)
            return "\\*S  ";
        if (_control == global.button0)
            return "\\*Z  ";
        if (_control == global.button1)
            return "\\*X  ";
        if (_control == global.button2)
            return "\\*C  ";
    }
    var left_bracket = (global.lang == "en" ? "[" : "[")
    var right_bracket = (global.lang == "en" ? "]" : "]")
    _control = ((left_bracket + global.asc_def[global.input_k[argument0]]) + right_bracket)
    if (!is_string(_control))
        _control = "[?]"
    else
        return _control;
    return;
}

