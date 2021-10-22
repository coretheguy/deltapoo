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

function ossafe_savedata_save() {
    if (!global.is_console)
    {
    }
    else
    {
        if (global.savedata_async_id >= 0 || global.savedata_async_load)
            return 0;
        buffer_async_group_begin("Deltarune")
        buffer_async_group_option("showdialog", 0)
        buffer_async_group_option("savepadindex", 0)
        buffer_async_group_option("slottitle", "DELTARUNE")
        buffer_async_group_option("subtitle", "DELTARUNE Save Data")
        var json = json_encode(global.savedata)
        global.savedata_buffer = buffer_create((string_byte_length(json) + 1), buffer_fixed, 1)
        buffer_write(global.savedata_buffer, buffer_string, json)
        buffer_save_async(global.savedata_buffer, "deltarune_ch1.sav", 0, buffer_get_size(global.savedata_buffer))
        global.savedata_async_load = 0
        global.savedata_debuginfo = "save in progress"
        global.savedata_async_id = buffer_async_group_end()
    }
    return;
}

