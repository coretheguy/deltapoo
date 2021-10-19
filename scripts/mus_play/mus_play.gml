function mus_play(snd)  {
    _xsndinstance = audio_play_sound(argument0, 90, false)
    snd_volume(_xsndinstance, global.flag[16], 0)
    return _xsndinstance;
}



function mus_loop(argument0) {
    _xsndinstance = audio_play_sound(argument0, 90, true)
    snd_volume(_xsndinstance, (1 * global.flag[16]), 0)
    return _xsndinstance;
}

function mus_loop_ext(snd, vol, pitch) {
    snd_volume(argument0, (argument1 * global.flag[16]), 0)
    snd_pitch(argument0, argument2)
    return mus_loop(argument0);
}

function mus_fade(snd, fade) {
    audio_sound_gain(argument0, 0, ((argument1 * 1000) / fps))
    return;
}



function mus_volume(snd, vol, time) {
    audio_sound_gain(argument0, (argument1 * global.flag[16]), ((argument2 * 1000) / fps))
    return;
}

function mus_initplay(snd) {
    global.currentsong[0] = snd_init(argument0)
    global.currentsong[1] = mus_play(global.currentsong[0])
    return;
}

function mus_initloop(snd) {
    global.currentsong[0] = snd_init(argument0)
    global.currentsong[1] = mus_loop(global.currentsong[0])
    return;
}

