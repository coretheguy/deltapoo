function ossafe_file_text_close(argument0) {
    if (!global.is_console)
        return file_text_close(argument0);
    else
    {
        var handle = argument0
        if ds_map_find_value(handle, "is_write")
            ds_map_set(global.savedata, ds_map_find_value(handle, "filename"), ds_map_find_value(handle, "data"))
        ds_map_destroy(handle)
    }
    return;
}

function ossafe_file_text_open_write(file) {
    if (!global.is_console)
        return file_text_open_write(argument0);
    else
    {
        var handle = ds_map_create()
        ds_map_set(handle, "is_write", 1)
        ds_map_set(handle, "filename", string_lower(argument0))
        ds_map_set(handle, "data", "")
        return handle;
    }
}

