function mus_play(){

}

function mus_loop(argument0) {
    _xsndinstance = audio_play_sound(argument0, 90, true)
    snd_volume(_xsndinstance, (1 * global.flag[16]), 0)
    return _xsndinstance;
}


function mus_volume(snd, vol, time) {
    audio_sound_gain(argument0, (argument1 * global.flag[16]), ((argument2 * 1000) / fps))
    return;
}

