sinetimer++
bultimer++
siner = sin(sinetimer / 16) * 80

if type = 1 {
	draw_sprite_ext(sprite_index, image_index, x, y + siner, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	
	if bultimer mod 30 == 0 {
		
		var i = -4
		repeat(8) {
			
			rand = irandom_range(-30, 30)
			snd_play_x(snd_queen_hoot_0, 0.5, choose(4, 4.5, 5))
			b = instance_create(x, (y + siner) + (sprite_height / 2), obj_dog_bark)
			b.direction = (-180 + (i * 25)) + rand
			b.speed = 6
			b.image_angle = b.direction
			b.damage = damage
			b.target = target
			i++
		}
	}
}
if type = 2 {
	draw_self()
}