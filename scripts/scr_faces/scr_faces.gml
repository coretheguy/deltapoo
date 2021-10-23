function scr_susface(msgno, stri) {
    global.msg[argument0] = stringsetloc("\\TX \\F0 \\E" + string(argument1) + " \\FS \\TS %", "scr_susface_slash_scr_susface_gml_1_0")
    return;
}

function scr_noface(msgno) {
    global.msg[argument0] = stringsetloc("\\TX \\F0 \\T0 %", "scr_noface_slash_scr_noface_gml_1_0")
    return;
}

function scr_noeface(msgno, stri) {
    global.msg[argument0] = stringsetloc("\\TX \\F0 \\E" + string(argument1) + " \\FN \\TN %", "scr_noeface_slash_scr_noeface_gml_1_0")
    return;
}

function scr_ralface(msgno, stri) {
    global.msg[argument0] = stringsetloc("\\TX \\F0 \\E" + string(argument1) + " \\FR \\TR %", "scr_ralface_slash_scr_ralface_gml_1_0")
    return;
}

