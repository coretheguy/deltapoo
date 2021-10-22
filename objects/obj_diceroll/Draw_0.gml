xx = __view_get(0, 0)
yy = __view_get(1, 0)

if con = 1 {
	
	draw_text_transformed_color(xx + 320, yy + 110, string(realmult), image_xscale, image_yscale, 0, c_white, c_white, c_white, c_white, image_alpha)
	if image_alpha < 0
		con = 2
}