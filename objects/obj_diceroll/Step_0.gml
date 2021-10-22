if con = 0 {
	
	mult1 = irandom_range(1, 7)
	mult2 = irandom_range(1, 7)
	
	realmult = (mult1 + mult2)
	
	switch realmult {
		case 2: realmult = 2 break
		case 3: realmult = 1.5 break
		case 4: realmult = 1.35 break
		case 5: realmult = 1.12 break
		case 6: realmult = 1 break
		case 7: realmult = 0.9 break
		case 8: realmult = 0.85 break
		case 9: realmult = 0.77 break
		case 10: realmult = 0.70 break
		case 11: realmult = 0.65 break
		case 12: realmult = 0.5 break
	}
	
	con = 1
}

if con = 1 {
	//timer++
	
	
	
	image_alpha -= 0.05
	image_xscale += 0.08
	image_yscale += 0.08
	
	
	
}

if con = 2 {
	

	
	with creator {
		
		dmgmult = other.realmult
		
		
	}
	
	//if realmult {
		
	//}
	
	global.turntimer = 0
	
	instance_destroy()
}