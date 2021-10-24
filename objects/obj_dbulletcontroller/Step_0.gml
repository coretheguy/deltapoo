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

if (type == 1021)
{
	
	
	if btimer > (10 * ratio) and btimer < (30 * ratio) and made = 0 {
		
		
		d = instance_create(obj_growtangle.x - 240, cameraheight() + 10, obj_chatbot_textleft)
		d.orient = 0
		d.damage = damage
		d.target = target
		d.vspeed = -1
		d.gravity = -0.5
		
		made = 1
	}
	
	if btimer > (40 * ratio) and made = 1 {
		
		
		d = instance_create(obj_growtangle.x + 5, cameraheight() + 10, obj_chatbot_textleft)
		d.orient = 1
		d.damage = damage
		d.target = target
		d.vspeed = -1
		d.gravity = -0.5
		
		made = 0
	}
	
	if btimer > 70 * ratio and made = 0 {
		btimer = 0
	}

}
if (type == 1022)
{
    if (btimer >= (24 * ratio))
    {
        btimer = 0
        radius = (150 + random(-100))
        yy = (radius * side)
        xx = (-180 + random(0))
        num = choose(1)
        if (num == 1)
        d = instance_create(((obj_growtangle.x + 15) + xx), ((obj_growtangle.y) + yy), obj_chatbot_mail)
        d.damage = damage
        d.target = target
    }
}

else if (type >= 23 && type <= 25)
{
    if (init == true)
    {
        global.monsterinstance[creator].visible = false
        d = instance_create(x, y, obj_spamton_attack_mode)
        d.creator = creator
        d.attack = (type - 23)
        d.depth++
        init = 2
        btimer = -10
        if (type == 25)
            instance_create(obj_growtangle.x, obj_growtangle.y, obj_spamton_warped_box)
        if (type == 23)
        {
            d.bullettype = obj_spamton_jumper
            d.firingspeed = 10
        }
        else if (type == 24)
        {
            d.bullettype = obj_spamton_wordbullet
            d.firingspeed = 28
            btimer = 10
        }
        d.damage = damage
        d.target = target
        d.grazepoints = 4
    }
    else if (type == 25 && btimer >= 8 && global.turntimer > 50)
    {
        xx = ((minx - random(30)) - 20)
        yy = ((obj_growtangle.y - random(200)) + 100)
        d = instance_create(xx, yy, obj_spamton_dollar)
        d.damage = damage
        d.target = target
        d.grazepoints = 4
        d.speed = 0.1
        btimer = 0
    }
}


if type = 1005 {
	
	if made = 0 {
		
		dice1 = instance_create(-10, -10, obj_diceroll)
		dice1.creator = creator
		made = 1
	}
	
}

if (type == 1006)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made == 0)
    {
        d = instance_create((300 + xx), (-20 + yy), obj_dicebul)
        e = instance_create((360 + xx), (-60 + yy), obj_dicebul)
        d.target = target
        d.damage = damage
        e.target = target
        e.damage = damage
        made = 1
    }
}
if (type == 1007)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made < 3 && btimer >= 15)
    {
        btimer = 0
        mine = instance_create((300 + xx), (-20 + yy), obj_dicebul)
        mine.damage = damage
        mine.target = target
        with (obj_dicebul)
        {
            gravity = (0.15 + gravbonus)
            image_xscale = 1
            image_yscale = 1
        }
        made += 1
    }
}
if (type == 1008)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made < 4 && btimer >= 15)
    {
        btimer = 0
        mine = instance_create((300 + xx), (yy - 40), obj_dicebul)
        mine.damage = damage
        mine.target = target
        with (mine)
        {
            hspeed = (1.2 + random(1.2))
            hspeed *= choose(-1, 1)
            gravbonus = random(0.1)
            gravity = (0.15 + gravbonus)
            image_xscale = 0.7
            image_yscale = 0.7
        }
        made += 1
    }
}
if (type == 10010)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (btimer >= 15)
    {
        btimer = 0
        dicecomet = instance_create(choose((xx + 680), (xx - 100)), (0 - random(100)), obj_dicebul)
        dicecomet.damage = damage
        dicecomet.target = target
        with (dicecomet)
        {
            image_xscale = 2
            image_yscale = 2
            if (x > (__view_get((0 << 0), 0) + 320))
                hspeed = (-6 - random(1))
            else
                hspeed = (6 + random(1))
            vspeed = (2 + random(2))
        }
    }
}
if (type == 10011)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made < 4 && btimer >= 15)
    {
        btimer = 0
        bb = instance_create((300 + xx), (-20 + yy), obj_dicebul)
        bb.damage = damage
        bb.target = target
        with (obj_dicebul)
        {
            gravity = (0.15 + gravbonus)
            image_xscale = 1
            image_yscale = 1
        }
        if (made == 3)
        {
            with (bb)
            {
                green = 1
                image_blend = c_lime
            }
        }
        made += 1
    }
}
if (type == 10012)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made == 0)
    {
        db = instance_create((320 + xx), (-20 + yy), obj_dicebul)
        db.image_xscale = 1
        db.image_yscale = 1
        db.damage = damage
        db.target = target
        made = 1
    }
}
if (type == 10013)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (made < 2 && btimer >= 20)
    {
        db[made] = instance_create((320 + xx), (-20 + yy), obj_dicebul)
        db[made].image_xscale = 1
        db[made].image_yscale = 1
        db[made].damage = damage
        db[made].target = target
        if (made == 1)
        {
            with (db[1])
            {
                green = 1
                image_blend = c_lime
            }
            db[1].hspeed = (-db[0].hspeed)
        }
        made += 1
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