if con = 0 {
	
	mult1 = irandom_range(1, 7)
	mult2 = irandom_range(1, 7)
	con = 1
}

if con = 1 {
	//timer++
	image_alpha -= 0.05
	image_xscale += 0.02
	image_yscale += 0.02
	
	
	
}

if con = 2 {
	
	instance_destroy()
}