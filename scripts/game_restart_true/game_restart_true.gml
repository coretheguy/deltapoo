function game_restart_true() {
    snd_free_all()
    game_restart()
    return;
}

function ossafe_game_end() {
    game_restart_true()
    return;
}

