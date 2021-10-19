function snd_play(argument0) {
    return audio_play_sound(argument0, 50, false);
}


function snd_play_pitch(argument0, argument1) {
    var _mysnd = audio_play_sound(argument0, 50, false)
    snd_pitch(_mysnd, argument1)
    return _mysnd;
}

function snd_play_volume(snd, vol) {
    var _mysnd = audio_play_sound(argument0, 50, false)
    snd_volume(_mysnd, argument1, 0)
    return _mysnd;
}

function snd_volume(argument0, argument1, argument2) {
    audio_sound_gain(argument0, argument1, ((argument2 * 1000) / fps))
    return;
}

function snd_stop(snd) {
    audio_stop_sound(argument0)
    return;
}

function snd_stop_all() {
    audio_stop_all()
    return;
}

function snd_play_x(snd, vol, pitch) {
    var _mysnd = audio_play_sound(argument0, 50, false)
    snd_volume(_mysnd, argument1, 0)
    snd_pitch(_mysnd, argument2)
    return _mysnd;
}



function snd_loop(snd) {
    return audio_play_sound(argument0, 50, true);
}


function snd_pause(snd) {
    if global.is_console
        snd_volume(argument0, 0, 0)
    audio_pause_sound(argument0)
    return;
}

function snd_resume(snd) {
    if global.is_console
        snd_volume(argument0, 1, 0)
    audio_resume_sound(argument0)
    return;
}

function snd_is_playing(snd) {
    return audio_is_playing(argument0);
}



