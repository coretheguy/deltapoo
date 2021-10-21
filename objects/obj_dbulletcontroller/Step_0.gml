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

if (type == 13)
{
    if (made > 0)
        return;
    if (sameattacker == false)
    {
        side = irandom(2)
        monstercount = scr_monsterpop()
        yoffset = 5
        if (monstercount != sameattack)
            yoffset += 20
        made = 1
        sidedirection = ((irandom(1) * 2) - 1)
        cars = (scr_monsterattacknamecount("CarChase") > 0 || scr_monsterattackidcount(16) > false)
        for (i = 0; i < (monstercount == 1 ? 2 : 3); i++)
        {
            xx = obj_growtangle.x
            if (sameattack == true)
                xx = (xx + (70 * (-sidedirection)))
            d = instance_create(xx, (miny - yoffset), obj_viro_invaderfleet)
            d.lborder = (minx + 10)
            d.rborder = (maxx - 10)
            d.fleetsize = sameattack
            d.fleetspeed = monstercount
            d.grazepoints = 5
            d.caralert = cars
            d.movedirection *= sidedirection
            yoffset += (monstercount == true ? 40 : 20)
            sidedirection *= -1
            d.damage = damage
            d.target = target
            if (i == side)
                d.shottimer = (sameattack == monstercount ? 15 : 5)
            if (sameattack == monstercount)
            {
                d.bigshot = 1
                d.grazepoints = 4
            }
        }
    }
    else if (sameattacker == true && instance_exists(obj_viro_invaderfleet))
    {
        obj_viro_invaderfleet.targetB = target
        made = 1
    }
}

if (type == 14)
{
    if (btimer >= (ratio == 1 ? 6 : (10 * ratio)))
    {
        xx = ((maxx + 40) + random(140))
        if (sameattacker == true)
            xx = ((minx - 40) - random(140))
        yy = (miny + random(obj_growtangle.sprite_height))
        if (scr_monsterpop() == 1)
        {
            special--
            if (special == false)
                yy = (obj_heart.y + 10)
            if (special <= false)
                special = (irandom(5) + 5)
        }
        d = instance_create(xx, yy, obj_viro_needle)
        btimer = 0
        d.direction = (sameattacker == false ? 180 : 0)
        d.image_angle = direction
        d.damage = damage
        d.target = target
        d.grazepoints = 5
        d.speed = 1
        if (scr_monsterpop() == 1)
            d.friction = -0.2
        else
            d.friction = -0.15
    }
}