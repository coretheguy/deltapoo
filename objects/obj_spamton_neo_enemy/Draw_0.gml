if (partmode == 10)
    partmode = 9
	
if (state == 0)
    fsiner++
var hidebgvines = 0
if (i_ex(obj_battlecontroller) && global.mercymod[myself] > 89)
    hidebgvines = 1
var bgvinecount = 0

for (var ii = 0; ii < 18; ii += 1)
{
    if (partvisible_back[ii] == 1)
        bgvinecount++
    if (hidebgvines == 0)
    {
        if (partmode != 34)
            heartattackoffsetx = 0
        draw_set_color(make_colour_rgb(0, 51, 0))
        partsiner_back[ii] += 0.5
        if (instance_exists(obj_sneo_bulletcontroller) && obj_sneo_bulletcontroller.type == 8.5)
            draw_set_alpha(image_alpha)
        if (partvisible_back[ii] == 1)
            draw_line_width(((((x + partx_back[ii]) + partxoff_back[ii]) + heartattackoffsetx) + (sin((partsiner_back[ii] / 30)) * 2)), ((y + party_back[ii]) + partyoff_back[ii]), (((x + partx_back[ii]) + heartattackoffsetx) + partxoff_back[ii]), -400, 1)
        draw_set_alpha(1)
        if (violentendflash > 0)
        {
            draw_set_color(c_white)
            draw_set_alpha((violentendflash / 10))
            if (partvisible_back[ii] == 1)
                draw_line_width(((((x + partx_back[ii]) + partxoff_back[ii]) + heartattackoffsetx) + (sin((partsiner_back[ii] / 30)) * 2)), ((y + party_back[ii]) + partyoff_back[ii]), (((x + partx_back[ii]) + heartattackoffsetx) + partxoff_back[ii]), -400, 1)
            draw_set_alpha(1)
        }
    }
}

if (weakentimer > 0)
{
    weakentimer++
    if (weakenshakeamount > 0)
        weakenshakeamount -= 0.5
}

if (lastwirecon == 0 || lastwirecon == 1)
{
    draw_set_color(make_colour_rgb(0, 51, 0))
    if (instance_exists(obj_sneo_bulletcontroller) && obj_sneo_bulletcontroller.type == 8.5)
        draw_set_alpha(image_alpha)
    draw_line_width(((((x + partx[4]) + (partxoff[4] / 1.2)) + 20) + (sin((partsiner[4] / 25)) * 1.8)), (((y + party[4]) - 10) + partyoff[4]), (((x + partx[4]) + (partxoff[4] / 1.5)) + 32), -400, 1)
    draw_set_alpha(1)
    if (violentendflash > 0)
    {
        draw_set_color(c_white)
        draw_set_alpha((violentendflash / 10))
        draw_line_width(((((x + partx[4]) + (partxoff[4] / 1.2)) + 20) + (sin((partsiner[4] / 25)) * 1.8)), (((y + party[4]) - 10) + partyoff[4]), (((x + partx[4]) + (partxoff[4] / 1.5)) + 32), -400, 1)
        draw_set_alpha(1)
    }
}

if (endcon == 1 && lastwirecon == 0)
    lastwirecon = 1
if (lastwirecon == 1)
{
    lastwiretimer++
    if (lastwiretimer == 30)
        lastwirecon = 2
}
if (lastwirecon == 1 || lastwirecon == 2)
{
    draw_set_alpha((lastwiretimer / 30))
    draw_set_color(c_green)
    draw_line_width(((((x + partx[4]) + (partxoff[4] / 1.2)) + 20) + (sin((partsiner[4] / 25)) * 1.8)), (((y + party[4]) - 10) + partyoff[4]), (((x + partx[4]) + (partxoff[4] / 1.5)) + 32), -400, (1 + (lastwiretimer / 30)))
    draw_set_alpha(1)
}

var fgvinecount = 0
for (var i = 0; i < 6; i += 1)
{
    draw_set_color(c_green)
    var weakenshakeamount2 = 0
    if (partweakened[i] == 1)
        weakenshakeamount2 = (weakenshakeamount - (random(weakenshakeamount) * 2))
    if (partweakened[i] > 0)
        draw_set_color(c_orange)
    if (instance_exists(obj_sneo_bulletcontroller) && obj_sneo_bulletcontroller.type == 8.5)
        draw_set_alpha(image_alpha)
    if (partvisible[i] == true)
    {
        draw_line_width((((((x + partx[i]) + (partxoff[i] / 1.2)) + (i * 5)) + (sin((partsiner[i] / 30)) * 2)) + weakenshakeamount2), ((((y + party[i]) - 10) + partyoff[i]) + weakenshakeamount2), (((x + partx[i]) + (partxoff[i] / 1.5)) + (i * 8)), -400, 2)
        fgvinecount++
    }
    draw_set_alpha(1)
    if (partweakened[i] == 1 && weakentimer < 11)
    {
        draw_set_color(c_white)
        draw_set_alpha((11 - (weakentimer / 10)))
        if instance_exists(obj_sneo_phonecall)
            draw_set_alpha(image_alpha)
        draw_line_width((((((x + partx[i]) + (partxoff[i] / 1.2)) + (i * 5)) + (sin((partsiner[i] / 30)) * 2)) + weakenshakeamount2), ((((y + party[i]) - 10) + partyoff[i]) + weakenshakeamount2), (((x + partx[i]) + (partxoff[i] / 1.5)) + (i * 8)), -400, 2)
        draw_set_alpha(1)
    }
    if (violentendflash > 0)
    {
        draw_set_color(c_white)
        draw_set_alpha((violentendflash / 10))
        if instance_exists(obj_sneo_phonecall)
            draw_set_alpha(image_alpha)
        draw_line_width((((((x + partx[i]) + (partxoff[i] / 1.2)) + (i * 5)) + (sin((partsiner[i] / 30)) * 2)) + weakenshakeamount2), ((((y + party[i]) - 10) + partyoff[i]) + weakenshakeamount2), (((x + partx[i]) + (partxoff[i] / 1.5)) + (i * 8)), -400, 2)
        draw_set_alpha(1)
    }
    if (partweakened[i] == 1 && weakentimer == 10)
        partweakened[i] = 2
}

if (specialcon == 1)
{
    specialcontimer++
    for (i = 0; i < 8; i += 1)
    {
        partrot[i] = lerp(partrot[i], 0, (0.07 * f))
        partx[i] = lerp(partx[i], 0, (0.05 * f))
        party[i] = lerp(party[i], 0, (0.03 * f))
    }
    flameframe = ((specialcontimer / 4) % 2)
    flamealpha = (specialcontimer / 15)
    if (flamealpha >= 0.9)
        flamealpha = 0.9
    if (specialcontimer >= 15)
    {
        flamealpha = (1 - (specialcontimer / 60))
        if (flamealpha < 0)
            flamealpha = 0
    }
    if (specialcontimer >= 60)
    {
        specialcontimer = 12
        specialcon = 0
        image_index = 0
    }
    draw_sprite_ext(spr_bhero, (10 + flameframe), (x + 75), (y + 177), -2, (2.8 + abs((sin((specialcontimer / 4)) / 2))), 0, c_blue, flamealpha)
    draw_sprite_ext(spr_bhero, (11 - flameframe), (x + 75), (y + 177), -2, 2.8, 0, c_teal, (flamealpha / 1.4))
}

shocker -= (1 * f)

for (i = 0; i < 8; i += 1)
{
    if (partmode < 20)
    {
        if (partmode == 0)
        {
            partsiner[i] = 0
            partframe[i] = 0
            if (i == 5)
            {
                partrot[i] = lerp(partrot[i], 30, (0.25 * f))
                partx[i] = lerp(partx[i], -10, (0.25 * f))
                party[i] = lerp(party[i], 10, (0.25 * f))
                if (dead == true)
                    partframe[i] = 3
            }
            else
            {
                partrot[i] = lerp(partrot[i], 0, (0.25 * f))
                partx[i] = lerp(partx[i], 0, (0.25 * f))
                party[i] = lerp(party[i], 0, (0.25 * f))
                if (abs(partrot[i]) < 1)
                    partrot[i] = 0
                if (abs(partx[i]) < 1)
                    partx[i] = 0
                if (abs(party[i]) < 1)
                    party[i] = 0
            }
        }
        if (partmode == 1 || partmode == 3 || partmode >= 5)
        {
            if (partmode == 1 && aimmode != 0)
                aimmode = 0
            if ((partmode == 3 || (partmode >= 9 && partmode <= 13)) && i == 1)
            {
                if (aimmode == 2 && instance_exists(obj_heart) && partmode == 3)
                    armaim = (point_direction((x + partxoff[i]), (y + partyoff[i]), (obj_heart.x + 8), (obj_heart.y + 8)) + 90)
                else if (aimmode != 1)
                    armaim = -80
                if (partmode < 10)
                    partrot[i] = lerp(partrot[i], armaim, (0.25 * f))
                if (partmode < 9)
                    partframe[i] = (partmode == 3 ? 1 : 3)
                if (partmode == 12)
                    partframe[i] = 1
                if (partmode >= 10)
                {
                    if (partrot[i] == armaim)
                        partrot[i] = (armaim + 2)
                    else
                        partrot[i] = armaim
                }
            }
            else if (partmode >= 6 && partmode < 11 && i == 1)
            {
                partrot[i] = lerp(partrot[i], -160, (0.25 * f))
                if (partframe[i] != 2 && partrot[i] <= -90)
                    partframe[i] = 2
            }
            else
            {
                if (i == 1)
                {
                    if (partmode == 5 || partmode == 1)
                        partframe[i] = 0
                }
                partsiner[i] += ((1 + (i / 5)) * f)
                partrot[i] = (sin((partsiner[i] / 30)) * 15)
            }
            if (i == 5)
            {
                partx[i] = lerp(partx[i], 0, (0.25 * f))
                party[i] = lerp(party[i], 0, (0.25 * f))
                partrot[i] -= (10 * f)
                if (partmode == 5 || partmode == 8 || partmode == 9)
                {
                    partrot[i] /= 2
                    partrot[i] += (10 * f)
                    partframe[i] = 1
                }
                else if (partmode == 6 || partmode == 7)
                {
                    partrot[i] /= 2
                    if (partmode > 6 || partrot[1] <= -120)
                        partframe[i] = 0
                }
                else if (partmode == 11)
                    partframe[i] += (0.2 * f)
                else if (partmode == 12)
                    partframe[i] += (0.3 * f)
                else
                    partframe[i] += (0.05 * f)
                if (partframe[i] >= 3)
                    partframe[i] = 0
                if (partframe[i] >= 2)
                    partrot[i] += (20 * f)
            }
        }
        if (partmode == 2)
        {
            partsiner[i] += ((1 + (i / 5)) * f)
            partx[i] = sin(((partsiner[i] / 2) * f))
            party[i] = cos(((partsiner[i] / 2) * f))
            if (shocker < 0)
            {
                partrot[i] = (60 - random(120))
                if (i == 5)
                {
                    partframe[i] += (1 * f)
                    if (partframe[i] >= 3)
                        partframe[i] = 0
                }
            }
        }
        if (partmode == 4)
        {
            idealrot[0] = -43
            idealrot[1] = -180
            idealrot[2] = -20
            idealrot[3] = -10
            idealrot[4] = -31
            idealrot[5] = -60
            idealrot[6] = -61
            idealrot[7] = -56
            if (shotanimtimer == (0.125 * f) && i == 1)
            {
                armendx = (((x + partx[1]) + partxoff[1]) + lengthdir_x(armlength, (partrot[1] - 93)))
                armendy = (((y + party[1]) + partyoff[1]) + lengthdir_y(armlength, (partrot[1] - 93)))
                if instance_exists(obj_sneo_heartattack)
                    aimmode = 0
            }
            shotanimtimer += (0.125 * f)
            if (shotanimtimer < 13)
            {
                partframe[5] = 2
                partrot[i] = lerp(partrot[i], idealrot[i], (0.3 * f))
                lerper = 0
            }
            if (shotanimtimer >= 13)
            {
                partframe[5] = 1
                lerper += (0.015 * f)
                if (i != 1)
                    partrot[i] = lerp(partrot[i], (sin((partsiner[i] / 30)) * 15), lerper)
                if (i == 1)
                    partrot[i] = lerp(partrot[i], armaim, lerper)
            }
            if (shotanimtimer >= 24)
            {
                shotanimtimer = 0
                partmode = 3
            }
        }
        if (partmode == 6)
            shotanimtimer = 0
        if (partmode == 7)
        {
            partrot[5] += (sin((shotanimtimer / 5)) * 15)
            shotanimtimer += (0.2 * f)
            if (shotanimtimer > 60)
                partmode = 6
        }
        if (partmode == 20)
        {
            partrot[0] = (-96 + random(3))
            partrot[1] = (-143 + random(3))
            partrot[2] = (-81 + random(3))
            partrot[3] = (-1 + random(3))
            partrot[4] = (-67 + random(3))
            partrot[5] = (-45 + random(3))
            partframe[5] = 2
            partrot[6] = (127 + random(3))
            partrot[7] = (-43 + random(3))
        }
        if (i == 5)
        {
            if (partmode >= 15 && partmode <= 18)
            {
                if (partmode == 15)
                {
                    partframe[5] = 2
                    headsize = lerp(headsize, 0.5, 0.25)
                }
                if (partmode == 16)
                {
                    partframe[5] = 2
                    headsize = lerp(headsize, 1, 0.25)
                }
                if (partmode == 17)
                {
                    partframe[5] = 2
                    headsize = lerp(headsize, 1.5, 0.25)
                    partrot[5] += random(20)
                }
            }
            else
                headsize = lerp(headsize, 0, 0.25)
        }
    }
	
	scalebonus = 0
    if (i == 5)
        scalebonus = headsize
    if (shadow_amount >= 0)
        partblend[i] = merge_color(c_white, c_black, shadow_amount)
    if (facing == -1)
        lastxoff = 110
    else
        lastxoff = 0
    if instance_exists(obj_dbulletcontroller)
    {
        partframe[5] = 3
        partblend[5] = blend
    }
    else if (partblend[5] == blend)
        partblend[5] = c_white
    var shakevar = 0
    if (i == 0)
    {
        if (hurttimer2 > 0)
            hurttimer2--
        if (hurttimer2 == 1)
        {
            if (endcon == 0)
            {
                shockthreshold = 10
                partmode = 1
            }
            if ((didwejustdie == 0 && i_ex(obj_battlecontroller) && global.monsterhp[global.chartarget[myself]] <= 0) || (didwejustdie == 0 && i_ex(obj_battlecontroller) && global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.1) && scr_sideb_get_phase() > 2 && weirdpathendcon == 0))
            {
                partmode = 99
                dontchangepose = 1
            }
        }
    }
    if (hurttimer2 > 0)
        shakevar = ((random(hurttimer2) / 2) - (hurttimer2 / 4))
    if (headendcon == 1)
    {
        partrot[5] = (-37 + sin((partsiner[4] / 16)))
        partframe[5] = 1
        partsprite[5] = spr_sneo_head
    }
    if (headendcon == 2)
    {
        partrot[5] = (15 + sin((partsiner[4] / 16)))
        partsprite[5] = spr_sneo_head_sad
    }
    if (headendcon == 3)
        partsprite[5] = spr_sneo_head
    if (instance_exists(obj_pipis_destroy_fx) && i == 5)
        partrot[5] -= random(60)
    if (headforceframe != -1 && i == 5)
        partframe[5] = headforceframe
	
	var expand = 0
    if (i == 5)
        expand = headexpand
    draw_monster_body_part_ext(partsprite[i], partframe[i], ((((x + (partx[i] * facing)) + (partxoff[i] * facing)) + lastxoff) + shakevar), (((y + party[i]) + partyoff[i]) - shakevar), (((2 + scalebonus) * facing) + expand), ((2 + scalebonus) + expand), (partrot[i] * facing), partblend[i], image_alpha)
    if (violentendflash > 0)
    {
        d3d_set_fog(true, c_white, 0, 1)
        draw_monster_body_part_ext(partsprite[i], partframe[i], ((((x + (partx[i] * facing)) + (partxoff[i] * facing)) + lastxoff) + shakevar), (((y + party[i]) + partyoff[i]) - shakevar), ((2 + scalebonus) * facing), (2 + scalebonus), (partrot[i] * facing), partblend[i], (violentendflash / 10))
        d3d_set_fog(false, c_black, 0, 0)
    }
}