


if type == 2 {
	
	if bultimer == 5
		snd_play(snd_carhonk)
	if bultimer > 20 {//20 and bultimer < 80 {
		
		var ir = irandom_range(3, 8)
		
		if bultimer mod ir == 0 {
			
			var xx = camerawidth()
			var yymin = obj_growtangle.y - (obj_growtangle.sprite_height / 2) - 30
			var yymax = obj_growtangle.y + (obj_growtangle.sprite_height / 2) + 30
			
			var rand = random_range(yymin, yymax)
			
			snd_play_x(snd_drive, 0.4, irandom_range(0.8, 1.2))
			bb = instance_create(xx + 10, rand, obj_dog_bulcar)
			bb.hspeed = random_range(-8, -12)
			bb.image_xscale = 1
			bb.image_yscale = 1
			bb.damage = damage
			bb.target = target
		}
	}
	
	if bultimer == 100 {
		
	}
}