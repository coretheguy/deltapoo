active = true
if (dont == 0)
{
    vspeed = -2
	hspeed = 2
    }
    draw_sprite_ext(sprite_index, 0, x, y, (2 - image_alpha), (2 - image_alpha), 0, c_white, image_alpha)
    if (type == 0)
    {
        if (speed > 4)
            speed = 4
    }
    if (y > (__view_get((1 << 0), 0) + 500))
        instance_destroy()
    if (y < (__view_get((1 << 0), 0) - 20))
        instance_destroy()
dont = 0
    draw_sprite_ext(sprite_index, 0, x, y, (2 - image_alpha), (2 - image_alpha), 0, c_white, image_alpha)
    if (type == 0)
    {
            speed += 0.1
			if (speed > 4)
			speed = 4
    }
    if (y > (__view_get((1 << 0), 0) + 500))
        instance_destroy()
    if (y < (__view_get((1 << 0), 0) - 20))
        instance_destroy()
dont = 0

if downcount > 0
{
downcount--
}
	if downcount = 0
	{
		sprite_index = spr_chatbot_mailattackopen
		mis = instance_create(x, y, obj_chatbot_missile)
		mis.gravity = 1
		mis.vspeed = -2
		downcount = -1
	}