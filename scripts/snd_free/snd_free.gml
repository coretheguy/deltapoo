function snd_free_all() {
    with (obj_astream)
        instance_destroy()
    return;
}

function snd_free(snd) {
    if instance_exists(obj_astream)
    {
        _xstream = argument0
        obj_astream.bstream = _xstream
        with (obj_astream)
        {
            if (bstream == mystream)
                instance_destroy()
        }
    }
    return;
}

