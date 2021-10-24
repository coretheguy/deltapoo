draw_self()

animtimer++
if (animtimer == anim_max)
    image_index++
if (animtimer == (anim_max * 2))
{
    image_index--
    animtimer = 0
}