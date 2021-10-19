ts = (ts+2 mod ts_max)

time++



var pt = 350//((camerax() + (view_wport[0] / 2)) - 40)
var ptt = 300

var _xx = lengthdir_x(100, ts)
var _yy = lengthdir_y(100, ts)

draw_sprite_ext(spr_dogcar, -1, pt + _xx, ptt + _yy, 2, 2, point_direction(pt + _xx, ptt + _yy, pt, ptt), c_white, image_alpha)

x = ts
y = ts



if time mod 1 = 0 {
	
	var dognum = 1//irandom_range(45,  80)
	
	for (var i = 0; i < dognum; i++) {
		
		var rand = (random_range(0.1, 0.8) * choose(-1, 1))
		
		var newdog = instance_create(irandom_range(-20, 620), 500, obj_marker)
		newdog.sprite_index = spr_dogcar
		newdog.vspeed = -random_range(7, 14)
		newdog.hspeed = random_range(-2, 2)
		newdog.image_xscale = rand
		newdog.image_yscale = rand
		newdog.image_angle = random_range(-120, 120)
		newdog.friction = random_range(0.01, 0.5)
		newdog.image_speed = 0.2
		with newdog
			scr_depth()
		
	}
	
}

if i_ex(obj_marker) {
	
	with obj_marker {
		
		image_alpha -= 0.02
		
		if image_alpha <= 0
			instance_destroy()
	}
}

if time >= 120 {
		//with obj_marker
		//	instance_destroy()
		time = 0
}