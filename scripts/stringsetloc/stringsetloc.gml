function stringsetloc(argument0, argument1) {
    var str = argument0
    if (!is_english())
        str = scr_84_get_lang_string(argument1)
    return stringset(str);
}

function stringset(argument0) {
	return argument0;
}

function stringsetsub(stre, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    return stringset(str);
}



function stringsetsubloc() {
	
	var args
	
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var format_string = argument[0]
    var localized_format_string_id = argument[(len - 1)]
    if (!is_english())
        format_string = scr_84_get_lang_string(localized_format_string_id)
    var str = substringargs(format_string, 1, args)
    return stringset(str);
}

function substringargs(_str, _offset, _args) {
    var str = argument0
    var offset = argument1
    var args = argument2
    var sub_id = 1
    var num_args = array_length(args)
    var len = ((num_args - offset) + 1)
    while (sub_id < len)
    {
        var sub = ("~" + string(sub_id))
        var ndx = ((sub_id + offset) - 1)
        str = string_replace_all(str, sub, args[ndx])
        sub_id = (sub_id + 1)
    }
    return str;
}



