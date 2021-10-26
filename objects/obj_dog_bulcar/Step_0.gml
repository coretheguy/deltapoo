/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
aftertimer++

if x < camerax() + (sprite_width + 10)
	instance_destroy()
	
if aftertimer mod 4 == 0 {
	a = scr_afterimage()
	a.image_alpha = 0.8
	a.fadeSpeed = 0.08
}