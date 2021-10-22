draw_self()

xx = __view_get(0, 0)
yy = __view_get(1, 0)

var txt = betchances[irandom_range(0, array_length(betchances) - 1)]

if !gamble
	draw_text(360 + xx, 100 + yy, txt)
else
	draw_text_transformed(360 + xx, 100 + yy, string(bet), 4, 4, 0)