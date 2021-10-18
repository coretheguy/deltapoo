trackpos = audio_sound_get_track_position(global.currentsong[1])
//if keyboard_check_pressed(ord("R"))
//    room_restart()
//if keyboard_check_pressed(ord("N"))
//    audio_sound_set_track_position(global.currentsong[1], 10)
if (maindog == 0)
{
    maindog = instance_create(0, 120, obj_marker)
    maindog.sprite_index = spr_dogcar
    maindog.hspeed = 10
    maindog.image_xscale = -2
    maindog.image_yscale = 2
    maindog.image_speed = 0.25
    with (maindog)
        scr_depth()
}
trigpoint = 11.375
if ((trackpos >= (trigpoint - 0.03) && trackpos <= (trigpoint + 0.01)) || (trackpos >= (trigpoint - 0.03) && trackpos <= (trigpoint + 0.01)))
{
    var dognum = irandom_range(4, 8)
    for (var i = 0; i < dognum; i++)
    {
        var newdog = instance_create(0, (120 + random_range(-40, 40)), obj_marker)
        newdog.sprite_index = spr_dogcar
        newdog.hspeed = random_range(10, 16)
        newdog.image_xscale = -1
        newdog.image_yscale = 1
        newdog.friction = random_range(0.01, -0.01)
        newdog.image_speed = (((hspeed / 4) * 0.25) + 0.25)
        with (newdog)
            scr_depth()
    }
}
trigpoint = 14
if ((trackpos >= (trigpoint - 0.03) && trackpos <= (trigpoint + 0.01)) || (trackpos >= (trigpoint - 0.03) && trackpos <= (trigpoint + 0.01)))
{
    dognum = irandom_range(5, 12)
    for (i = 0; i < dognum; i++)
    {
        newdog = instance_create(683, (120 + random_range(-40, 40)), obj_marker)
        newdog.sprite_index = spr_dogcar
        newdog.hspeed = (-random_range(10, 16))
        newdog.image_xscale = 1
        newdog.image_yscale = 1
        newdog.friction = random_range(0.01, -0.01)
        newdog.image_speed = (((hspeed / 4) * 0.25) + 0.25)
        with (newdog)
            scr_depth()
    }
}
if i_ex(obj_marker)
{
    with (obj_marker)
    {
        if (x > 683)
        {
            if (id != other.maindog)
                instance_destroy()
        }
    }
}
with (maindog)
{
    trigpoint = 2.74
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = -10
        image_xscale = (-sign(hspeed) * 2)
        x = 683
    }
    trigpoint = 5.643
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = 10
        image_xscale = (-sign(hspeed) *2)
        x = 0
    }
    trigpoint = 8.653
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = -10
        image_xscale = (-sign(hspeed) *2)
        x = 683
    }
    trigpoint = 11.375
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = 12
        image_xscale = (-sign(hspeed) *2)
        x = 0
    }
    trigpoint = 14
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = -12
        image_xscale = (-sign(hspeed) *2)
        x = 683
    }
    trigpoint = 16.557
    if (other.trackpos >= (trigpoint - 0.03) && other.trackpos <= (trigpoint + 0.01))
    {
        hspeed = 8
        image_xscale = (-sign(hspeed) *2)
        x = 0
    }
}
