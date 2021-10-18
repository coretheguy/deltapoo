function stringsetloc(argument0, argument1) {
    var str = argument0
    if (!is_english())
        str = scr_84_get_lang_string(argument1)
    return stringset(str);
}

function stringset(argument0) {
	return argument0;
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

