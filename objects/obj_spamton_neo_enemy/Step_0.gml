if (bigshot == 1)
    global.sp = 5
if (cantspareinit == 0 && scr_sideb_get_phase() > 2 && i_ex(obj_battlecontroller))
{
    obj_battlecontroller.cantspare[0] = 1
    cantspareinit = 1
}
if (scr_sideb_get_phase() > 2)
    global.mercymod[myself] = 0