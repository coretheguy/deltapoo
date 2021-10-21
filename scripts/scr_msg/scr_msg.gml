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

function msgsetsubloc(msg_id, stri, str_id, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var msg_index = argument[0]
    var format_string = argument[1]
    var localized_format_string_id = argument[(len - 1)]
    if (!is_english())
        format_string = scr_84_get_lang_string(localized_format_string_id)
    var str = substringargs(format_string, 2, args)
    msgset(msg_index, str)
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


function scr_asterskip() {
    if (aster == true && autoaster == true)
    {
        length += 2
        mystring = string_insert("||", mystring, i)
    }
    if (aster == 2)
        aster = true
    return;
}


function scr_anyface_next(face, index) {
    global.msgno++
    scr_anyface(argument0, global.msgno, argument1)
    return;
}

function scr_anyface(_speakerC, _msgno, _emotion) {
    //_speakerC = argument0
    //_msgno = argument1
    //_emotion = argument2
    if is_real(argument2)
    {
        if (argument2 >= 10)
        {
            if (argument2 < 36)
                _emotion = chr((55 + argument2))
            else
                _emotion = chr((61 + argument2))
        }
    }
    _speaker = string_lower(_speakerC)
    if (_speaker == "susie" || _speaker == "sus")
        scr_susface(_msgno, _emotion)
    if (_speaker == "ralsei" || _speaker == "ral")
        scr_ralface(_msgno, _emotion)
    if (_speaker == "noelle" || _speaker == "noe")
        scr_noeface(_msgno, _emotion)
    if (_speaker == "toriel" || _speaker == "tor")
        scr_torface(_msgno, _emotion)
    if (_speaker == "asgore" || _speaker == "asg")
        scr_asgface(_msgno, _emotion)
    if (_speaker == "king" || _speaker == "kin")
        scr_kingface(_msgno, _emotion)
    if (_speaker == "rudy" || _speaker == "rud")
        scr_rudface(_msgno, _emotion)
    if (_speaker == "lancer" || _speaker == "lan")
        scr_lanface(_msgno, _emotion)
    if (_speaker == "berdly" || _speaker == "ber")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\FB \\TB %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_23_0")
    if (_speaker == "alphys" || _speaker == "alp")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\Fa \\Ta %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_24_0")
    if (_speaker == "none" || _speaker == "x" || _speaker == "no name" || _speaker == "no_name")
        scr_noface(_msgno)
    if (_speaker == "rouxls" || _speaker == "rou")
        scr_rurusface(_msgno, _emotion)
    if (_speaker == "queen" || _speaker == "que")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\FQ \\TQ %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_27_0")
    if (_speaker == "queen2" || _speaker == "que2")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\F0 \\Tq %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_28_0_b")
    if (_speaker == "sans" || _speaker == "san")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\Fs \\Ts %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_28_0")
    if (_speaker == "undyne" || _speaker == "und")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\FU \\TU %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_29_0")
    if (_speaker == "burgerpants")
        msgsetsubloc(argument1, "\\TX \\F0 \\E~1 \\Fb \\T0 %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_30_0")
    if (_speaker == "sneo")
        msgsetsub(argument1, "\\TX \\F0 \\E~1 \\Tp %", string(_emotion))
    return;
}

function scr_speaker(speaker) {
    _speaker = argument0
    global.typer = 5
    if (global.darkzone == true)
        global.typer = 6
    if (global.fighting == true)
        global.typer = 4
    global.fc = 0
    global.fe = 0
    if (_speaker == "silent" && global.darkzone == false)
        global.typer = 2
    if (_speaker == "silent" && global.darkzone == true)
        global.typer = 36
    if (_speaker == "balloon" || _speaker == "enemy")
        global.typer = 50
    if (_speaker == "sans")
    {
        global.typer = 14
        global.fc = 6
    }
    if (_speaker == "undyne" || _speaker == "und")
    {
        global.typer = 17
        global.fc = 9
    }
    if (_speaker == "temmie" || _speaker == "tem")
        global.typer = 21
    if (_speaker == "jevil")
        global.typer = 35
    if (_speaker == "catti")
        global.fc = 13
    if (_speaker == "jockington" || _speaker == "joc")
        global.fc = 14
    if (_speaker == "catty" || _speaker == "caddy")
        global.fc = 16
    if (_speaker == "bratty" || _speaker == "bra")
        global.fc = 17
    if (_speaker == "rouxls" || _speaker == "rou")
        global.fc = 18
    if (_speaker == "burgerpants" || _speaker == "bur")
        global.fc = 19
    if (_speaker == "spamton")
    {
        if (global.fighting == false)
            global.typer = 66
        else
            global.typer = 68
    }
    if (_speaker == "sneo")
        global.typer = 67
    if (_speaker == "susie" || _speaker == "sus")
    {
        global.fc = 1
        global.typer = 10
        if (global.darkzone == true)
        {
            global.typer = 30
            if (global.fighting == true)
                global.typer = 47
        }
    }
    if (_speaker == "ralsei" || _speaker == "ral")
    {
        global.fc = 2
        global.typer = 31
        if (global.fighting == true)
            global.typer = 45
        if (global.flag[30] == 1)
            global.typer = 6
    }
    if (_speaker == "noelle" || _speaker == "noe")
    {
        global.fc = 3
        if (global.darkzone == false)
            global.typer = 12
        else
            global.typer = 56
        if (global.fighting == true)
            global.typer = 59
    }
    if (_speaker == "toriel" || _speaker == "tor")
    {
        global.fc = 4
        global.typer = 7
    }
    if (_speaker == "asgore" || _speaker == "asg")
    {
        global.fc = 10
        global.typer = 18
    }
    if (_speaker == "king" || _speaker == "kin")
    {
        global.fc = 20
        global.typer = 33
        if (global.chapter == 1)
        {
            if (global.plot < 235)
                global.typer = 36
        }
        if (global.fighting == true)
            global.typer = 48
    }
    if (_speaker == "rudy" || _speaker == "rud")
    {
        global.fc = 15
        global.typer = 55
    }
    if (_speaker == "lancer" || _speaker == "lan")
    {
        global.fc = 5
        global.typer = 32
        if (global.fighting == true)
            global.typer = 46
    }
    if (_speaker == "berdly" || _speaker == "ber")
    {
        global.fc = 12
        if (global.darkzone == false)
            global.typer = 13
        else
            global.typer = 57
        if (global.fighting == true)
            global.typer = 77
    }
    if (_speaker == "alphys" || _speaker == "alp")
    {
        global.fc = 11
        global.typer = 20
    }
    if (_speaker == "queen" || _speaker == "que")
    {
        global.fc = 21
        global.typer = 58
    }
    if (_speaker == "queen_2" || _speaker == "que_2")
    {
        global.fc = 21
        global.typer = 62
    }
    return;
}


