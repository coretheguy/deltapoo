function snd_play(argument0) {
    return audio_play_sound(argument0, 50, false);
}


function snd_play_pitch(argument0, argument1) {
    var _mysnd = audio_play_sound(argument0, 50, false)
    snd_pitch(_mysnd, argument1)
    return _mysnd;
}


function snd_volume(argument0, argument1, argument2) {
    audio_sound_gain(argument0, argument1, ((argument2 * 1000) / fps))
    return;
}

