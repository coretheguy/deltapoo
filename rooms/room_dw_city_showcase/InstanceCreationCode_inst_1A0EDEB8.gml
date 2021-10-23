snd_free_all()
mus_volume(global.currentsong[1], 0, 0.1)
global.currentsong[0] = snd_init("cybercity.ogg")
global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)