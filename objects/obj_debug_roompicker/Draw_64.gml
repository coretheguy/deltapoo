

if  keyboard_check(vk_shift) and keyboard_check_pressed(vk_up) and sel > 0 {
	snd_play(snd_menumove)
	sel--
}
if keyboard_check(vk_shift) and keyboard_check_pressed(vk_down) and sel < room_last {
	snd_play(snd_menumove)
	sel++
}
	
if keyboard_check(vk_shift) and keyboard_check_pressed(ord("Z"))
	room_goto(sel)
	
if keyboard_check(vk_shift) and keyboard_check_pressed(ord("X"))
	global.darkzone = !global.darkzone

var darkercol = make_color_rgb(205, 0, 0)
var maincol = make_color_rgb(255, 0, 0)
var origcol = draw_get_color()

draw_set_color(maincol)
draw_text(40, 40, room_get_name(sel))
draw_text(20, 20, "dark: " + string(global.darkzone))
draw_set_color(darkercol)
if sel < room_last
	draw_text(40, 60, room_get_name(sel + 1))
if sel > 0
	draw_text(40, 20, room_get_name(sel - 1))
draw_set_color(origcol)