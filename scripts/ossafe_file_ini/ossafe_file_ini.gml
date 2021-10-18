function ossafe_ini_open(argument0) {
	
    if (!global.is_console)
        ini_open(argument0)
    else
    {
        var name = string_lower(argument0)
        global.current_ini = name
        var file = ds_map_find_value(global.savedata, name)
        if is_undefined(file)
            var data = ""
        else
            data = file
        ini_open_from_string(data)
    }
    return;
}

function ossafe_ini_close() {
    if (!global.is_console)
        return ini_close();
    else if (!is_undefined(global.current_ini))
    {
        ds_map_set(global.savedata, global.current_ini, ini_close())
        global.current_ini = undefined
    }
    return;
}

