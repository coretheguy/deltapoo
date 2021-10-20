if (init == false)
{
    sameattack = scr_monsterattacknamecount(global.monsterattackname[creator])
    if (sameattack > true)
    {
        if (creator == 2)
            sameattacker = (sameattack - 1)
        else if (creator == 1)
            sameattacker = (sameattack == 3 ? creator : global.monsterattackname[0] == global.monsterattackname[1])
    }
    if instance_exists(obj_growtangle)
    {
        miny = (obj_growtangle.y - (obj_growtangle.sprite_height / 2))
        maxy = (obj_growtangle.y + (obj_growtangle.sprite_height / 2))
        minx = (obj_growtangle.x - (obj_growtangle.sprite_width / 2))
        maxx = (obj_growtangle.x + (obj_growtangle.sprite_width / 2))
    }
    init = true
}
btimer += 1

// ATTACKS

if (type == 0)
{
    if (btimer >= (timermax * ratio))
    {
        btimer = 0
        dir = (30 + random(120))
        radius = (140 + random(80))
        var xx = lengthdir_x(radius, dir)
        var yy = lengthdir_y(radius, dir)
        bm = instance_create(((obj_heart.x + 8) + xx), ((obj_heart.y + 8) + yy), obj_dbullet_maker)
        bm.grazepoints = grazepoints
        if (bm.y < (__view_get((1 << 0), 0) + 40))
            bm.y = (__view_get((1 << 0), 0) + 40)
        bm.damage = damage
        bm.target = target
    }
}

if (type == 1)
{
    if (btimer >= (9 * ratio))
    {
        btimer = 0
        radius = (140 + random(40))
        yy = (radius * side)
        xx = (-100 + random(200))
        num = choose(0, 1, 2, 3)
        if (num == 3)
            xx = (-10 + random(20))
        d = instance_create(((obj_heart.x + 8) + xx), ((obj_heart.y + 8) + yy), obj_dbullet_vert)
        d.damage = damage
        d.target = target
    }
}