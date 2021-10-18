ts = (ts+2 mod ts_max)

time++



var pt = 350//((camerax() + (view_wport[0] / 2)) - 40)
var ptt = 300

var _xx = lengthdir_x(100, ts)
var _yy = lengthdir_y(100, ts)

draw_sprite_ext(spr_dogcar, -1, pt + _xx, ptt + _yy, 2, 2, point_direction(pt + _xx, ptt + _yy, pt, ptt), c_white, image_alpha)

x = ts
y = ts



if time = 1 {
	
	var dognum = irandom_range(23, 30)
	
	for (var i = 0; i < dognum; i++) {
		
		var newdog = instance_create(irandom_range(20, 620), 500, obj_marker)
		newdog.sprite_index = spr_dogcar
		newdog.vspeed = -random_range(7, 14)
		newdog.image_xscale = 1
		newdog.image_yscale = 1
		newdog.image_angle = random_range(20, 120)
		newdog.friction = 0.2
		newdog.image_speed = 0.1
		with newdog
			scr_depth()
		
	}
	
}

if i_ex(obj_marker) {
	
	with obj_marker {
		
		image_alpha -= 0.02
	}
}

if time >= 120 and i_ex(obj_marker) {
		with obj_marker
			instance_destroy()
		time = 0
}