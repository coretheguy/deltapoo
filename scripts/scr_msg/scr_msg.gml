function scr_nextmsg() {
    msgno += 1
    lineno = 0
    aster = false
    halt = false
    pos = 1
    alarm[0] = 1
    drawaster = true
    autoaster = true
    miniface_pos = 0
    miniface_current_pos = -1
    mystring = nstring[msgno]
    formatted = false
    wxskip = 0
    sound_played = false
    forcebutton1 = false
    if (rate < 3)
    {
        firstnoise = false
        alarm[2] = 1
    }
    return;
}

function msgsetloc(msg_id, stri, str_id) {
    var msg_index = argument0
    var str = argument1
    var localized_string_id = argument2
    if (!is_english())
        str = scr_84_get_lang_string(localized_string_id)
    msgset(msg_index, str)
    return;
}

function msgnextloc(stri, str_id) {
    var str = argument0
    var localized_string_id = argument1
    if (!is_english())
        str = scr_84_get_lang_string(localized_string_id)
    msgnext(str)
    return;
}

function msgset(msg_id, stri) {
    global.msgno = argument0
    global.msg[argument0] = argument1
    return;
}

function msgnext(stri) {
    global.msgno++
    msgset(global.msgno, argument0)
    return;
}




