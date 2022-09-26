function scr_roomname(rm) {
	
	roomname = stringset("The Universe")
	
	return roomname;

}

function draw_text_shadow(xx, yy, txt) {
    __txtcolor__ = draw_get_color()
    draw_set_color(c_black)
    draw_text((argument0 + 1), (argument1 + 1), string_hash_to_newline(argument2))
    draw_set_color(__txtcolor__)
    draw_text(argument0, argument1, string_hash_to_newline(argument2))
    return;
}

