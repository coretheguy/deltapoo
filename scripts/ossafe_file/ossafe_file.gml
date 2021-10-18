function ossafe_file_exists(argument0) // gml_Script_ossafe_file_exists
{
    if (!global.is_console)
        return file_exists(argument0);
    else
        return (variable_global_exists("savedata") && (!is_undefined(ds_map_find_value(global.savedata, argument0))));
}

function ossafe_file_delete(argument0) {
    if (!global.is_console)
        return file_delete(argument0);
    else if (!is_undefined(ds_map_find_value(global.savedata, argument0)))
        ds_map_delete(global.savedata, argument0)
    return;
}
