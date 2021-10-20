function c_cmd(cmd, arg1, arg2, arg3, arg4) {
    if instance_exists(obj_cutscene_master)
    {
        __cs_i = (obj_cutscene_master.maximum_command - 1)
        obj_cutscene_master.command[__cs_i] = argument0
        obj_cutscene_master.command_arg1[__cs_i] = argument1
        obj_cutscene_master.command_arg2[__cs_i] = argument2
        obj_cutscene_master.command_arg3[__cs_i] = argument3
        obj_cutscene_master.command_arg4[__cs_i] = argument4
        with (obj_cutscene_master)
            maximum_command++
    }
    return;
}

function c_cmd_x(cmd, arg1, arg2, arg3, arg4, arg5, arg6) {
    if instance_exists(obj_cutscene_master)
    {
        __cs_i = (obj_cutscene_master.maximum_command - 1)
        obj_cutscene_master.command[__cs_i] = argument0
        obj_cutscene_master.command_arg1[__cs_i] = argument1
        obj_cutscene_master.command_arg2[__cs_i] = argument2
        obj_cutscene_master.command_arg3[__cs_i] = argument3
        obj_cutscene_master.command_arg4[__cs_i] = argument4
        obj_cutscene_master.command_arg5[__cs_i] = argument5
        obj_cutscene_master.command_arg6[__cs_i] = argument6
        with (obj_cutscene_master)
            maximum_command++
    }
    return;
}


// *** COMMANDS ***

function c_sel(actor) {
    c_cmd("select", argument0, 0, 0, 0)
    return;
}

function c_walkdirect(x, y, spd) {
    c_cmd("walkdirect", argument0, argument1, argument2, 0)
    return;
}

function c_walkdirect_wait(x, y, spd) {
    c_walkdirect(argument0, argument1, argument2)
    c_wait(argument2)
    return;
}



function c_wait(time) {
    c_cmd("wait", argument0, 0, 0, 0)
    return;
}



function c_soundplay_wait(snd) {
    c_cmd("soundplay", argument0, 0, 0, 0)
    c_wait(round((audio_sound_length(argument0) * room_speed)))
    return;
}

function c_walktoobject(obj, oxoff, oyoff, spd) // gml_Script_c_walktoobject
{
    var _targetx = (argument0.x + argument1)
    var _targety = (argument0.y + argument2)
    c_cmd("walkdirect", _targetx, _targety, argument3, 0)
    c_walk()
    return;
}

function c_delaywalktoobject(delay, obj, oxoff, oyoff, spd) // gml_Script_c_delaywalktoobject
{
    _targetx = (argument1.x + argument2)
    _targety = (argument1.y + argument3)
    c_cmd_x("delaycmd", argument0, "walkdirect", _targetx, _targety, argument4, 0)
    return;
}

function c_walktoobject_wait(obj, oxoff, oyoff, spd) // gml_Script_c_walktoobject_wait
{
    c_walktoobject(argument0, argument1, argument2, argument3)
    c_wait(argument3)
    return;
}

function c_delaywalktoobject_wait(delay, obj, oxoff, oyoff, spd) // gml_Script_c_delaywalktoobject_wait
{
    c_delaywalktoobject(argument0, argument1, argument2, argument3, argument4)
    c_wait((argument0 + argument4))
    return;
}

function c_msgset(msgid, msgstr) {
    c_cmd("msgset", argument0, argument1, 0, 0)
    return;
}

function c_msgnext(msgstr) {
    c_cmd("msgnext", argument0, 0, 0, 0)
    return;
}

function c_msgsetsub(msgid, msgstr, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[1], 2, args)
    c_cmd("msgset", argument[0], str, 0, 0)
    return;
}

function c_msgnextsub(msgstr, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    c_cmd("msgnext", str, 0, 0, 0)
    return;
}

function c_msgsetloc(msgid, msgstr, lstid) {
    var msg_index = argument0
    var english = argument1
    var localized_string_id = argument2
    var str = english
    if (!is_english())
        str = scr_84_get_lang_string(localized_string_id)
    c_msgset(msg_index, str)
    return;
}

function c_msgnextloc(msgstr, lstid) {
    var str = argument0
    var localized_string_id = argument1
    if (!is_english())
        str = scr_84_get_lang_string(localized_string_id)
    c_msgnext(str)
    return;
}

function c_msgsetsubloc(msgid, msgstr, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var msg_index = argument[0]
    var format_string = argument[1]
    var localized_format_string_id = argument[(len - 1)]
    if (!is_english())
        format_string = scr_84_get_lang_string(localized_format_string_id)
    var str = substringargs(format_string, 2, args)
    c_msgset(msg_index, str)
    return;
}

function c_msgnextsubloc(msgstr, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var format_string = argument[0]
    var localized_string_id = argument[(len - 1)]
    if (!is_english())
        format_string = scr_84_get_lang_string(localized_string_id)
    var str = substringargs(format_string, 1, args)
    c_msgnext(str)
    return;
}



function c_facenext(arg1, arg2) {
    c_cmd("msgfacenext", argument0, argument1, 0, 0)
    return;
}

function c_waitcustom() {
    c_cmd("waitcustom", 0, 0, 0, 0)
    return;
}

function c_waitcustom_end() {
    with (obj_cutscene_master)
    {
        cs_wait_custom = 0
        waiting = 0
    }
    return;
}

function c_setxy(x, y) {
    c_cmd("setxy", argument0, argument1, 0, 0)
    return;
}

function c_addxy(x, y) {
    c_cmd("addxy", argument0, argument1, 0, 0)
    return;
}

function c_shake() {
    c_cmd("shake", 0, 0, 0, 0)
    return;
}



function c_shakex(xx, yy, spd) {
    c_cmd("shakex", argument0, argument1, argument2, 0)
    return;
}

function c_shakeobj() {
    c_cmd("shakeobj", 0, 0, 0, 0)
    return;
}

function c_pannable(tf) {
    c_cmd("pannable", argument0, 0, 0, 0)
    return;
}

function c_panobj(obj, spd) {
    c_cmd("panobj", argument0, argument1, 0, 0)
    return;
}

function c_pan(x, y, spd) {
    c_cmd("pan", argument0, argument1, argument2, 0)
    return;
}

function c_fadeout(spd) {
    c_cmd("fadeout", argument0, 0, 0, 0)
    return;
}

function c_fadein(spd) {
    c_cmd("fadeout", (-argument0), 0, 0, 0)
    return;
}

function c_fadeout_color(spd, col) {
    c_cmd("fadeout", argument0, argument1, 0, 0)
    return;
}

function c_pan_wait(x, y, spd) {
    c_pan(argument0, argument1, argument2)
    c_wait(argument2)
    return;
}

function c_panspeed(maxspd, x, y) {
    c_cmd("panspeed", argument0, argument1, argument2, 0)
    return;
}

function c_panspeed_wait(maxspd, x, y) {
    c_cmd("panspeed", argument0, argument1, argument2, 0)
    c_wait(argument2)
    return;
}

function c_imagespeed(spd) {
    c_cmd("imagespeed", argument0, 0, 0, 0)
    return;
}

function c_soundplay(snd) {
    c_cmd("soundplay", argument0, 0, 0, 0)
    return;
}

function c_soundplay_x(snd, vol, pitch) {
    c_cmd("soundplay", argument0, argument1, argument2, 0)
    return;
}

function c_mus(type) {
    c_cmd("mus", argument0, 0, 0, 0)
    return;
}

function c_mus2(type, arg1, arg2) {
    c_cmd("mus", argument0, argument1, argument2, 0)
    return;
}

function c_imageindex(ind) {
    c_cmd("imageindex", argument0, 0, 0, 0)
    return;
}

function c_visible(trfa) {
    c_cmd("visible", argument0, 0, 0, 0)
    return;
}

function c_saveload(saveload) {
    if scr_debug()
    {
        c_cmd("saveload", argument0, 0, 0, 0)
        if (argument0 == "save")
        {
            with (obj_cutscene_master)
            {
                if (loadedState == 1)
                {
                    loadedState = 0
                    scr_cutscene_master_commands_initialize()
                }
            }
        }
    }
    return;
}

function c_sprite(spr) {
    c_cmd("sprite", argument0, 0, 0, 0)
    return;
}

function c_halt() {
    c_cmd("halt", 0, 0, 0, 0)
    return;
}

function c_specialsprite(specspr) {
    c_cmd("specialsprite", argument0, 0, 0, 0)
    return;
}

function c_actortokris() {
    c_cmd("actortokris", 0, 0, 0, 0)
    return;
}

function c_actortocaterpillar() {
    c_cmd("actortocaterpillar", 0, 0, 0, 0)
    return;
}

function c_actormoveparty(spd) {
    __mcactor = scr_findactor("kris")
    if (__mcactor >= 0)
    {
        c_sel(__mcactor)
        c_walkdirect(obj_mainchara.x, obj_mainchara.y, argument0)
    }
    for (__jj = 0; __jj < 2; __jj++)
    {
        if i_ex(global.cinstance[__jj])
        {
            __mcactor = scr_findactor(global.cinstance[__jj].name)
            if (__mcactor >= 0)
            {
                c_sel(__mcactor)
                c_cmd("walkdirect", global.cinstance[__jj].x, global.cinstance[__jj].y, argument0, 0)
            }
        }
    }
    return;
}

function c_actormoveparty_single(actor, spd) {
    if (argument0 == 0)
    {
        c_sel(argument0)
        c_walkdirect(obj_mainchara.x, obj_mainchara.y, argument1)
    }
    else if i_ex(global.cinstance[(argument0 - 1)])
    {
        c_sel(argument0)
        c_walkdirect(global.cinstance[(argument0 - 1)].x, global.cinstance[(argument0 - 1)].y, argument1)
    }
    return;
}

function c_terminatekillactors() {
    c_cmd("terminatekillactors", 0, 0, 0, 0)
    return;
}

function c_facing(dir) {
    c_cmd("facing", argument0, 0, 0, 0)
    return;
}

function c_spin(spd) {
    c_cmd("spin", argument0, 0, 0, 0)
    return;
}

function c_fe(fe) { // to be honest, i'm not quite sure what fe even is for
    c_cmd("fe", argument0, -2, 0, 0)
    return;
}

function c_msgside(side) {
    c_cmd("msgside", argument0, 0, 0, 0)
    return;
}

function c_msgzurasu(onoff) {
    if (argument0 == 1)
        c_cmd("msgside", "zurasuon", 0, 0, 0)
    else
        c_cmd("msgside", "zurasuoff", 0, 0, 0)
    return;
}

function c_autowalk(time) {
    c_cmd("autowalk", argument0, 0, 0, 0)
    return;
}

function c_flip(dir) {
    c_cmd("flip", argument0, 0, 0, 0)
    return;
}

function c_autofacing(dir) {
    c_cmd("autofacing", argument0, 0, 0, 0)
    return;
}

function c_animate(ifr, efr, spd) {
    c_cmd("animate", argument0, argument1, argument2, 0)
    return;
}

function c_jump(ex, ey, jspd, jtm) {
    c_cmd("jump", argument0, argument1, argument2, argument3)
    return;
}

function c_jump_in_place(jspd, jtm) {
    c_cmd("jumpinplace", argument0, argument1, 0, 0)
    return;
}

function c_arg_objectxy(obj, x, y) {
    c_cmd("arg_objectxy", argument0, argument1, argument2, 0)
    return;
}




function c_var_lerp() {
    if (argument_count < 5)
        c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], 0)
    else
        c_cmd_x("var", 0, argument[0], argument[1], argument[2], argument[3], argument[4])
    return;
}

function c_var_lerp_instance() {
    if (argument_count < 6)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], 0)
    else if (argument_count == 6)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
    else if (argument_count == 7)
        c_cmd_x("var", argument[0], argument[1], argument[2], argument[3], argument[4], (string(argument[5]) + string(argument[6])))
    return;
}

function c_var(_var, _target) {
    c_cmd_x("var", 0, argument0, argument1, 0, 0, 0)
    return;
}

function c_actortoobject(actor) {
    c_cmd("actortoobject", argument0, 0, 0, 0)
    return;
}


function c_speaker(speaker) {
    c_cmd("speaker", argument0, 0, 0, 0)
    return;
}

function c_talk() {
    c_cmd("talk", 0, 0, 0, 0)
    return;
}

function c_wait_box(box) {
    c_cmd("waitbox", argument0, 0, 0, 0)
    return;
}

function c_wait_talk() {
    c_cmd("waitdialoguer", 0, 0, 0, 0)
    return;
}



function c_emote() {
    if (argument_count == 0)
        c_cmd("emote", "!", 30, 0, 0)
    else if (argument_count == 1)
        c_cmd("emote", argument[0], 30, 0, 0)
    else if (argument_count == 2)
        c_cmd("emote", argument[0], argument[1], 0, 0)
    else if (argument_count == 3)
        c_cmd("emote", argument[0], argument[1], argument[2], 0)
    return;
}



function c_script_instance(inst, scipt, args) {
    if (argument_count == 3)
        c_cmd_x("script", argument[0], argument[1], argument[2], -3.14, -3.14, -3.14)
    if (argument_count == 4)
        c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], -3.14, -3.14)
    if (argument_count == 5)
        c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], argument[4], -3.14)
    if (argument_count == 6)
        c_cmd_x("script", argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
    return;
}

function c_script_instance_stop(inst, scipt) {
    c_cmd_x("script", argument0, argument1, -10, 0, 0, 0)
    return;
}


function c_talk_wait() {
    c_talk()
    c_waittalk()
    return;
}


function c_waittalk() {
    c_cmd("waitdialoguer", 0, 0, 0, 0)
    return;
}



function c_walk(posx, posy, spd) {
    c_cmd("walk", argument0, argument1, argument2, 0)
    return;
}



function c_walk_wait(posx, posy, spd) {
    c_walk(argument0, argument1, argument2)
    c_wait(argument2)
    return;
}

function c_shakestep(xx,yy) {
    c_autowalk(false)
    c_imageindex(1)
    c_addxy(argument0, argument1)
    c_var("stepsound", 1)
    c_delaycmd(15, "imageindex", 0)
    c_shakeobj()
    return;
}

function c_shakestep_x(xx, yy, inddelay, arg4, arg5, stepsound) {
    c_autowalk(false)
    c_imageindex(1)
    c_addxy(argument0, argument1)
    if (argument5 == 1)
        c_var("stepsound", 1)
    c_delaycmd(argument2, "imageindex", 0)
    c_shakeobj()
    if (argument4 > 1)
    {
        for (__argi = 1; __argi < argument4; __argi++)
        {
            c_delaycmd((__argi * argument3), "imageindex", 1)
            c_delaycmd4((__argi * argument3), "addxy", argument0, argument1, 0, 0)
            if (argument5 == 1)
                c_delaycmd4((__argi * argument3), "var", 0, "stepsound", 1, 0)
            c_delaycmd(((__argi * argument3) + argument2), "imageindex", 0)
            c_delaycmd((__argi * argument3), "shakeobj", 0)
        }
    }
    return;
}

function c_var_instance(inst, _var, _target) {
    c_cmd_x("var", argument0, argument1, argument2, 0, 0, 0)
    return;
}



function c_delaycmd(delay, cmd, arg) {
    c_cmd_x("delaycmd", argument0, argument1, argument2, 0, 0, 0)
    return;
}

function c_delaycmd4(delay, cmd, arg1, arg2, arg3, arg4) {
    c_cmd_x("delaycmd", argument0, argument1, argument2, argument3, argument4, argument5)
    return;
}

