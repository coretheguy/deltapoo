quit_timer = 0
keyboard_active = 1
gamepad_active = 1
gamepad_check_timer = 0
gamepad_id = 0
axis_value = 0.4
fullscreen_toggle = 0
quicksaved = 0
window_center_toggle = 0
//if global.is_console
//{
//    if (!instance_exists(obj_gamecontroller))
//        instance_create(0, 0, obj_gamecontroller)
//    if (!i_ex(obj_border_controller))
//        instance_create(0, 0, obj_border_controller)
//}
paused = 0
pausing = 0
screenshot = -1
gif_recording = 0
gif_timer = 0
loaded = 0
border_fade_out = 0
border_fade_in = 0
border_alpha = 1
border_fade_value = 0.025
_border_image = 3221
if (instance_number(obj_time) > 1)
    instance_destroy()
else
{
    display_height = display_get_height()
    display_width = display_get_width()
    window_size_multiplier = 1
    for (_ww = 2; _ww < 6; _ww += 1)
    {
        if (display_width > (640 * _ww) && display_height > (480 * _ww))
            window_size_multiplier = _ww
    }
    if (window_size_multiplier > 1)
    {
        window_set_size((640 * window_size_multiplier), (480 * window_size_multiplier))
        alarm[2] = 1
    }
    //if (os_type == os_switch)
    //{
    //    switch_controller_support_set_defaults()
    //    switch_controller_support_set_singleplayer_only(1)
    //    switch_controller_set_supported_styles(7)
    //}
    scr_controls_default()
    scr_ascii_input_names()
    for (i = 0; i < 10; i += 1)
    {
        global.input_pressed[i] = 0
        global.input_held[i] = 0
        global.input_released[i] = 0
    }
    //if global.is_console
    //{
    //    application_surface_enable(true)
    //    application_surface_draw_enable(false)
    //}
    //scr_enable_screen_border(global.is_console)
}

colvis = false