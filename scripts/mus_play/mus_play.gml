function mus_play(){

}

function mus_loop(argument0) {
    _xsndinstance = audio_play_sound(argument0, 90, true)
    snd_volume(_xsndinstance, (1 * global.flag[16]), 0)
    return _xsndinstance;
}

