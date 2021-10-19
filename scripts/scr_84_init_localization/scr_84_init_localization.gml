function scr_84_init_localization() // gml_Script_scr_84_init_localization
{
    var _locale = os_get_language()
    if (os_type == os_switch)
        var _lang = substr(switch_language_get_desired_language(), 1, 2)
    else
        _lang = (substr(_locale, 1, 2) != "ja" ? "en" : "ja")
    global.lang = _lang
    if ossafe_file_exists("true_config.ini")
    {
        ossafe_ini_open("true_config.ini")
        global.lang = ini_read_string("LANG", "LANG", _lang)
        ossafe_ini_close()
    }
    if (!variable_global_exists("lang_loaded"))
        global.lang_loaded = ""
    if (global.lang_loaded != global.lang)
    {
        global.lang_loaded = global.lang
        if variable_global_exists("lang_map")
        {
            ds_map_destroy(global.lang_map)
            ds_map_destroy(global.font_map)
            ds_map_destroy(global.chemg_sprite_map)
            ds_map_destroy(global.chemg_sound_map)
        }
        global.lang_map = ds_map_create()
        global.font_map = ds_map_create()
        global.lang_missing_map = ds_map_create()
        global.chemg_sprite_map = ds_map_create()
        global.chemg_sound_map = ds_map_create()
        scr_84_lang_load()
        scr_ascii_input_names()
        global.chemg_last_get_font = ""
        if (global.lang == "ja")
        {
            var fm = global.font_map
            ds_map_add(fm, "main", 10)
            ds_map_add(fm, "mainbig", 8)
            ds_map_add(fm, "tinynoelle", 12)
            ds_map_add(fm, "dotumche", 7)
            ds_map_add(fm, "comicsans", 6)
            ds_map_add(fm, "small", 9)
            var sm = global.chemg_sprite_map
            ds_map_add(sm, "spr_bnamekris", spr_bnamekris)
            ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei)
            ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie)
            ds_map_add(sm, "spr_btact", spr_btact)
            ds_map_add(sm, "spr_btdefend", 2259)
            ds_map_add(sm, "spr_btfight", 2260)
            ds_map_add(sm, "spr_btitem", 2261)
            ds_map_add(sm, "spr_btspare", 2263)
            ds_map_add(sm, "spr_bttech", 2262)
            ds_map_add(sm, "spr_darkmenudesc", 2458)
            ds_map_add(sm, "spr_dmenu_captions", 2360)
            ds_map_add(sm, "spr_quitmessage", 3245)
            ds_map_add(sm, "spr_thrashbody_b", 2328)
            ds_map_add(sm, "spr_thrashfoot_b", 2326)
            ds_map_add(sm, "spr_fieldmuslogo", 2480)
            ds_map_add(sm, "spr_werewire_zzt_text", 3270)
            ds_map_add(sm, "spr_face_queen", 175)
            ds_map_add(sm, "spr_city_mice_sign_01", 247)
            ds_map_add(sm, "spr_city_mice_sign_02", 2815)
            ds_map_add(sm, "spr_city_mice_sign_03", 3177)
            ds_map_add(sm, "spr_bnamenoelle", 865)
            ds_map_add(sm, "spr_bnamethrash", 3308)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 2996)
            ds_map_add(sm, "spr_ch2_cityscreen", 3277)
            ds_map_add(sm, "spr_battlemsg", 3071)
            ds_map_add(sm, "spr_queenscreen", 2113)
            ds_map_add(sm, "spr_acrade_retire", 3154)
            ds_map_add(sm, "spr_sneo_playback", 3318)
            var sndm = global.chemg_sound_map
        }
        else
        {
            fm = global.font_map
            ds_map_add(fm, "main", fnt_main)
            ds_map_add(fm, "mainbig", fnt_mainbig)
            ds_map_add(fm, "tinynoelle", fnt_tinynoelle)
            ds_map_add(fm, "dotumche", fnt_dotumche)
            ds_map_add(fm, "comicsans", fnt_comicsans)
            ds_map_add(fm, "small", fnt_small)
            sm = global.chemg_sprite_map
            ds_map_add(sm, "spr_bnamekris", spr_bnamekris)
            ds_map_add(sm, "spr_bnameralsei", spr_bnameralsei)
            ds_map_add(sm, "spr_bnamesusie", spr_bnamesusie)
            ds_map_add(sm, "spr_btact", spr_btact)
            ds_map_add(sm, "spr_btdefend", spr_btdefend)
            ds_map_add(sm, "spr_btfight", spr_btfight)
            ds_map_add(sm, "spr_btitem", spr_btitem)
            ds_map_add(sm, "spr_btspare", spr_btspare)
            ds_map_add(sm, "spr_bttech", spr_bttech)
            ds_map_add(sm, "spr_darkmenudesc", spr_darkmenudesc)
            ds_map_add(sm, "spr_dmenu_captions", spr_dmenu_captions)
            ds_map_add(sm, "spr_quitmessage", spr_quitmessage)
            ds_map_add(sm, "spr_thrashbody_b", 2328)
            ds_map_add(sm, "spr_thrashfoot_b", 2326)
            ds_map_add(sm, "spr_fieldmuslogo", 2480)
            ds_map_add(sm, "spr_werewire_zzt_text", 1738)
            ds_map_add(sm, "spr_face_queen", 642)
            ds_map_add(sm, "spr_city_mice_sign_01", 3073)
            ds_map_add(sm, "spr_city_mice_sign_02", 3074)
            ds_map_add(sm, "spr_city_mice_sign_03", 3075)
            ds_map_add(sm, "spr_bnamenoelle", 2236)
            ds_map_add(sm, "spr_bnamethrash", 2234)
            ds_map_add(sm, "spr_cutscene_27_tender_goodbye", 373)
            ds_map_add(sm, "spr_ch2_cityscreen", 3058)
            ds_map_add(sm, "spr_battlemsg", 2524)
            ds_map_add(sm, "spr_queenscreen", 37)
            ds_map_add(sm, "spr_acrade_retire", 2190)
            ds_map_add(sm, "spr_sneo_playback", 3271)
            sndm = global.chemg_sound_map
        }
    }
    return;
}

