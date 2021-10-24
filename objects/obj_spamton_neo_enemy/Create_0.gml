scr_enemy_object_init()
if (global.fighting == false)
{
    myself = 0
    global.mercymod[myself] = 0
}
heart_attack_count = 10
heart_health = 25
heart_speed_scaling = 2
heart_1st_wave_timer = 6
heart_2nd_wave_timer = 11
heart_3rd_wave_timer = 16
heart_variant_arm_shoot_timer = 90
heart_turntimer = 1200
heart_hurt_timer_reduction = 27
heart_hurt_timer_reduction_bigshot = 108
heart_bullet_image_scale = 1.1
heart_bullet_speed_1st_wave = 0.1
heart_bullet_friction_1st_wave = 0.1
heart_bullet_speed_2nd_wave = 0.1
heart_bullet_friction_2nd_wave = 0.09
heart_bullet_speed_3rd_wave = 0.1
heart_bullet_friction_3rd_wave = 0.08
heart_bullet_gravity_acceleration = 1.075
crusher_start_hspeed = -3
crusher_start_hacceleration = 0.4
crusher_turret_speed = 15
crusher_turret_distance = 44
crusher_x_origin = 220
crusher_turret_bullet_speed = -0.5
crusher_turret_bullet_gravity = 0.5
upgrade = 0
bigshot = 1
bigshotused = 0
bigshotcount = 0
tinyralsei = 0
weakentimer = 0
weakenshakeamount = 0
maxvinecount = 6
vinecuttimer = 0
vinebgcount = 18
vineid = -1
snapallcount = 0
endcon = 0
weirdpathendcon = 0
weirdpathendtimer = 0
endtimer = 0
dancealtcon = 0
cantspareinit = 0
savemeactcon = 0
usedact = 0
difficulty = 0
turn = 0
phaseturn = 0
phase = 1
firstheartattack = 0
fireslasers = 0
haveusedfinalattack = 0
phonejokeplayerdied = 0
newcrushermovement = 1
sneomacaronihandscon = 0
flyingheadsbseen = 0
singleshotmercy = 0
prevmercy = 0
prevhearttack = 0
facebroken = 0
correct_answer = -1
hurttimer2 = 0
faceattackcount = 0
nothitduringphonehands = 1
sneo_defeat_cutscene_version = 0
targetbgspeed = 0
smoketimer = 0
smokethreshold = 1
didwejustdie = 0
dontchangepose = 0
lastwirecon = 0
lastwiretimer = 0
headendcon = 0
finalattackconversationcon = 0
funnycheat = 0
funnycheattimer = 0
funnycheattimer2 = 0
funnycheattimer3 = 0
headexpand = 0
hellmode = 0
laserflash = irandom(3)
talkmax = 90
image_speed = 0.16666666666666666
idlesprite = spr_sneo_example
hurtsprite = spr_sneo_example
sparedsprite = spr_sneo_example
custom_draw = 1
f = 2
image_xscale = 2
image_yscale = 2
sinerb = 0
lerper = 0
shocker = 0
dead = false
checkcount = 0
shake_head = 0
heart_release_con = 0
shocker_threshold = 10
shotanimtimer = 0
shocktimer = 0
shockthreshold = 10
laughtimer = 0
fakegrav = 0
falltimer = 0
fallshake = 10
aim = 1
hitcon = 0
hitdetector = instance_create(x, y, obj_sneo_hitdetector)
stoprumblesfx = 0
chargepitch = 0.1
chargesfxtimer = 0
dance_con = 0
dance_timer = 0
partfocus = 0
blend = merge_color(c_white, c_black, 0.15)
shootydanceinit = 0
shootydancex = x
shootydancey = y
partsprite[0] = spr_sneo_wingl
partsprite[1] = spr_sneo_arml
partsprite[2] = spr_sneo_legl
partsprite[3] = spr_sneo_legr
partsprite[4] = spr_sneo_body
partsprite[5] = spr_sneo_head
partsprite[6] = spr_sneo_armr
partsprite[7] = spr_sneo_wingr
for (i = 0; i < 8; i += 1)
{
    partframe[i] = 0
    partsiner[i] = 0
    partrot[i] = 0
    partblend[i] = c_white
    partx[i] = 0
    party[i] = 0
    partxoff[i] = (sprite_get_xoffset(partsprite[i]) * 2)
    partyoff[i] = (sprite_get_yoffset(partsprite[i]) * 2)
    partvisible[i] = true
    partweakened[i] = 0
}
for (ii = 0; ii < 18; ii += 1)
{
    partsiner_back[ii] = 0
    partx_back[ii] = 0
    party_back[ii] = 0
    partxoff_back[ii] = (sprite_get_xoffset(partsprite[0]) * (1.8 + (ii / 9)))
    partyoff_back[ii] = (sprite_get_yoffset(partsprite[0]) * 2)
    partvisible_back[ii] = 1
}
heartattackoffsetx = 0
extra_vines = 26
armlength = point_distance(partxoff[1], partyoff[1], 36, 146)
partmode = 1
songtime = 0
songplaying = 1
resumeinterval = 1.715
drawaimer = 0
phoneevent = 0
headmode = 0
vinex = 0
attackdebug = -1
difficultydebug = -1
musicdebug = 0
party_heal = 0
makeheart = 0
makeheartinit = 0
makehearttype = 0
makehearttimer = 0
makeheartalt = 0
violentendflash = 0
head_recoil_amount = 0
shadow_amount = 0
facing = 1
headhit = 0
headsize = 1
headforceframe = -1
aimmode = 0
armaim = -80
hitcontimer = 0
balloonorder = 0
ballooncon = 0
balloonend = 1
talkedcon = 0
init = false
statustextorder = 0
statustextalt = 0
statustextalt2 = 0
statustextupdate = 0
joke = 0
eyeshp = 16
nosehp = 16
mouthhp = 16
specialcontimer = 0
specialcon = 0
flameframe = 0
flamealpha = 0


function scr_damage_sneo_final_attack() {
    if (global.inv < 0)
    {
        var __element = 0
        if variable_instance_exists(id, "element")
        {
            if is_real(element)
                __element = element
        }
        if (target < 3)
        {
            if (global.hp[global.char[target]] <= 0)
            {
                scr_randomtarget_old()
                target = mytarget
                with (global.charinstance[target])
                {
                    image_blend = c_white
                    darkify = false
                }
            }
        }
        var __remtarget = -1
        if (target == 4)
        {
            __remtarget = 4
            scr_randomtarget_old()
            target = mytarget
            if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
            {
                scr_randomtarget_old()
                target = mytarget
            }
            if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
            {
                scr_randomtarget_old()
                target = mytarget
            }
            if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
            {
                scr_randomtarget_old()
                target = mytarget
            }
            with (global.charinstance[target])
            {
                image_blend = c_white
                darkify = false
            }
        }
        chartarget = 3
        tdamage = damage
        var oldcalculation = false
        if (target < 3)
        {
            chartarget = global.char[target]
            if (global.charaction[target] == 10)
                tdamage = ceil(((2 * tdamage) / 2))
            tdamage = ceil((tdamage * scr_element_damage_reduction(__element, global.char[target])))
            debug_message(("The element is: " + string(__element)))
            if (tdamage < 1)
                tdamage = 1
        }
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake)
        with (global.charinstance[target])
        {
            hurt = true
            hurttimer = 0
        }
        hpdiff = tdamage
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
                killactive = true
        }
        doomtype = -1
        with (obj_heart)
            dmgnoise = true
        if (target < 3)
        {
            if (global.hp[chartarget] <= 0)
            {
                doomtype = 4
                global.hp[chartarget] -= round((tdamage / 4))
                hpdiff = round((tdamage / 4))
            }
            else
            {
                global.hp[chartarget] -= tdamage
                if (global.hp[chartarget] <= 0)
                {
                    hpdiff = abs((global.hp[chartarget] - (global.maxhp[chartarget] / 2)))
                    doomtype = 4
                    global.hp[chartarget] = round(((-global.maxhp[chartarget]) / 2))
                    scr_dead(target)
                }
            }
            dmgwriter = instance_create(global.charinstance[target].x, ((global.charinstance[target].y + global.charinstance[target].myheight) - 24), obj_dmgwriter)
            dmgwriter.damage = hpdiff
            dmgwriter.type = doomtype
        }
        if (target == 3)
        {
            for (hpi = 0; hpi < 3; hpi += 1)
            {
                chartarget = global.char[hpi]
                if (global.hp[chartarget] >= 0)
                {
                    if oldcalculation
                        tdamage = ceil((tdamage - (global.battledf[hpi] * 3)))
                    else
                        tdamage = scr_damage_calculation(tdamage, hpi)
                    tdamage = ceil((tdamage * scr_element_damage_reduction(__element, chartarget)))
                    if (global.charaction[hpi] == 10)
                        global.hp[chartarget] -= ceil(((3 * tdamage) / 4))
                    else
                        global.hp[chartarget] -= tdamage
                    if (global.hp[chartarget] <= 0)
                        global.hp[chartarget] = round(((-global.maxhp[0]) / 2))
                }
            }
        }
        global.inv = (global.invc * 40)
        gameover = true
        if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
            gameover = false
        if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
            gameover = false
        if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
            gameover = false
        if (gameover == true)
            scr_gameover()
        if (__remtarget != -1)
            target = __remtarget
    }
    return;
}
