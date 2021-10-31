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

function scr_ds_list_write(list, amt) {
    var new_list = ds_list_create()
    for (var i = 0; i < argument1; i += 1)
        ds_list_add(new_list, argument0[i])
    var list_string = ds_list_write(new_list)
    ds_map_set(myfileid, "data", (ds_map_find_value(myfileid, "data") + list_string))
    ds_list_destroy(new_list)
    return;
}

function scr_ds_list_read(list) {
    var new_list = ds_list_create()
    var list_string = ossafe_file_text_read_string(argument0)
    if (list_string != "")
        ds_list_read(new_list, list_string)
    return new_list;
}



function ossafe_file_text_write_string(file, entry) {
    if (!global.is_console)
        return file_text_write_string(argument0, argument1);
    else
    {
        var handle = argument0
        ds_map_set(handle, "data", (ds_map_find_value(handle, "data") + argument1))
    }
    return;
}



function ossafe_file_text_write_real(file, entry) {
    if (!global.is_console)
        return file_text_write_real(argument0, argument1);
    else
    {
        var handle = argument0
        ds_map_set(handle, "data", (ds_map_find_value(handle, "data") + string(argument1)))
    }
    return;
}



function ossafe_file_text_writeln(file) {
    if (!global.is_console)
        return file_text_writeln(argument0);
    else
    {
        var handle = argument0
        ds_map_set(handle, "data", (ds_map_find_value(handle, "data") + "\r\n"))
    }
    return;
}


function ossafe_file_text_readln(file) {
    if (!global.is_console)
        return file_text_readln(argument0);
    else
    {
        var handle = argument0
        ds_map_set(handle, "line_read", 0)
        var line = ds_map_set(handle, "line", (ds_map_find_value(handle, "line") + 1))
        if (line >= ds_map_find_value(handle, "num_lines"))
            return "";
        text = ds_map_find_value(handle, "text")
        return (text[line] + "\r\n");
    }
}

function ossafe_file_text_read_real(file) {
    if (!global.is_console)
        return file_text_read_real(argument0);
    else
    {
        var handle = argument0
        if ds_map_find_value(handle, "line_read")
            return 0;
        var line = ds_map_find_value(handle, "line")
        if (line >= ds_map_find_value(handle, "num_lines"))
            return 0;
        ds_map_set(handle, "line_read", 1)
        text = ds_map_find_value(handle, "text")
        return real(text[line]);
    }
}

function ossafe_file_text_read_string(file) {
    if (!global.is_console)
        return file_text_read_string(argument0);
    else
    {
        var handle = argument0
        if ds_map_find_value(handle, "line_read")
            return "";
        var line = ds_map_find_value(handle, "line")
        if (line >= ds_map_find_value(handle, "num_lines"))
            return "";
        ds_map_set(handle, "line_read", 1)
        text = ds_map_find_value(handle, "text")
        return text[line];
    }
}


