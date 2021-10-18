function scr_dark_marker(argument0, argument1, argument2) {
    thismarker = instance_create(argument0, argument1, obj_marker)
    with (thismarker)
    {
        sprite_index = argument2
        image_speed = 0
        image_xscale = 2
        image_yscale = 2
    }
    return thismarker;
}