global.is_console = (os_type == os_switch || os_type == os_ps4)
global.screen_border_id = ""
global.screen_border_active = 1
global.screen_border_alpha = 0
global.screen_border_state = 0
global.screen_border_dynamic_fade_id = 0
global.screen_border_dynamic_fade_level = 0
global.savedata_async_id = -1
global.savedata_async_load = 0
global.savedata_error = 0
global.savedata_debuginfo = ""
global.game_won = 0
global.chapter = 2
//if instance_exists(obj_time)
//{
//    with (obj_time)
//        instance_destroy()
//}
//if instance_exists(obj_debugcontroller)
//{
//    with (obj_debugcontroller)
//        instance_destroy()
//}
//if global.is_console
//    ossafe_savedata_load()
//else
//{
    scr_84_init_localization()
    pal_swap_init_system(shd_pal_swapper)
    global.damagefont = font_add_sprite_ext(spr_numbersfontbig, "0123456789", 20, 0)
    global.damagefontgold = font_add_sprite_ext(spr_numbersfontbig_gold, "0123456789+-%", 20, 0)
    global.hpfont = font_add_sprite_ext(spr_numbersfontsmall, "0123456789-+", 0, 2)
    scr_gamestart()
    for (i = 0; i < 100; i += 1)
        global.tempflag[i] = 0
    global.heartx = 300
    global.hearty = 220
    if (!audio_group_is_loaded(audio_sfx))
        audio_group_load(audio_sfx)
    if (!instance_exists(obj_time))
        instance_create(0, 0, obj_time)
//}
