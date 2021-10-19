px = obj_mainchara.x + 9
py = obj_mainchara.y + 19

//var lx = lengthdir_x(14, px)
//var ly = lengthdir_y(32, py)

var _u = obj_mainchara.press_u
var _d = obj_mainchara.press_d
var _l = obj_mainchara.press_l
var _r = obj_mainchara.press_r

 
if _d > 0 {
	
	dir = 170
	depth = obj_mainchara.depth + 1 
}

 
if _u > 0 {
	
	dir = -10
	depth = obj_mainchara.depth - 1 
}

 
if _l > 0 {
	
	dir = 50
	
	depth = obj_mainchara.depth + 1 
}

 
if _r > 0 {
	
	dir = -45
	
	depth = obj_mainchara.depth + 1 
}

angle = lerp(angle, dir, 0.15)

//x = px + lx
//y = py + ly

draw_sprite_ext(sprite_index, 0, px, py, image_xscale, image_yscale, angle, image_blend, image_alpha)