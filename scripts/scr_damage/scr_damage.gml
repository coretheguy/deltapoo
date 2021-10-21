function scr_damage() {
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
                    darkify = 0
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
                darkify = 0
            }
        }
        chartarget = 3
        tdamage = damage
        var oldcalculation = 0
        if (target < 3)
        {
            if oldcalculation
                tdamage = ceil((tdamage - (global.battledf[target] * 3)))
            else
                tdamage = scr_damage_calculation(tdamage, target)
            chartarget = global.char[target]
            if (global.charaction[target] == 10)
                tdamage = ceil(((2 * tdamage) / 3))
            tdamage = ceil((tdamage * scr_element_damage_reduction(__element, global.char[target])))
            debug_message(("The element is: " + string(__element)))
            if (tdamage < 1)
                tdamage = 1
        }
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake)
        with (global.charinstance[target])
        {
            hurt = 1
            hurttimer = 0
        }
        hpdiff = tdamage
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
                killactive = 1
        }
        doomtype = -1
        with (obj_heart)
            dmgnoise = 1
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
                if (global.chapter == 2 && instance_exists(obj_gigaqueen_enemy) && global.hp[chartarget] <= 0)
                {
                    global.hp[chartarget] = 1
                    with (o_boxingcontroller)
                        event_user(3)
                }
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
        gameover = 1
        if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
            gameover = 0
        if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
            gameover = 0
        if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
            gameover = 0
        if (gameover == 1)
            scr_gameover()
        if (__remtarget != -1)
            target = __remtarget
    }
    return;
}

function scr_damage_all() {
    if (global.inv < 0)
    {
        remdamage = damage
        _temptarget = target
        for (ti = 0; ti < 3; ti += 1)
        {
            global.inv = -1
            damage = remdamage
            target = ti
            if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
                scr_damage()
        }
        global.inv = (global.invc * 40)
        target = _temptarget
    }
    return;
}



function scr_damage_all_overworld() {
    if (global.inv < 0)
    {
        remdamage = damage
        remtarget = target
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake)
        with (obj_dmgwriter)
            killactive = 1
        snd_stop(snd_hurt1)
        snd_play(snd_hurt1)
        for (ti = 0; ti < 3; ti += 1)
        {
            global.inv = -1
            damage = remdamage
            target = ti
            tdamage = damage
            with (global.charinstance[target])
            {
                hurt = 1
                hurttimer = 0
            }
            hpdiff = tdamage
            if (hpdiff >= global.hp[global.char[target]])
                hpdiff = (global.hp[global.char[target]] - 1)
            d_cancel = 0
            if (hpdiff <= 1)
            {
                d_cancel = 1
                hpdiff = 0
            }
            if (d_cancel == 0)
            {
                doomtype = -1
                global.hp[global.char[target]] -= hpdiff
                if (global.charinstance[target].visible == true)
                {
                    dmgwriter = instance_create(global.charinstance[target].x, ((global.charinstance[target].y + global.charinstance[target].myheight) - 24), obj_dmgwriter)
                    dmgwriter.damage = hpdiff
                    dmgwriter.type = doomtype
                }
            }
            if (global.hp[global.char[target]] < 1)
                global.hp[global.char[target]] = 1
        }
        gameover = 1
        if (global.char[0] != 0 && global.hp[global.char[0]] > 2)
            gameover = 0
        if (global.char[1] != 0 && global.hp[global.char[1]] > 2)
            gameover = 0
        if (global.char[2] != 0 && global.hp[global.char[2]] > 2)
            gameover = 0
        if (gameover == 1)
            scr_gameover()
        target = remtarget
        global.inv = (global.invc * 40)
    }
    return;
}

function scr_dmgwriter_selfchar() {
    return instance_create(x, (((y + myheight) - 24) - (tu * 20)), obj_dmgwriter);
}

function scr_party_hpaverage() {
    var _totalhp = 0
    var _totalmaxhp = 0
    var _members = 0
    for (var _hpi = 0; _hpi < 3; _hpi++)
    {
        if (global.char[_hpi] > 0)
        {
            _members++
            _totalhp += global.hp[global.char[_hpi]]
            _totalmaxhp += global.maxhp[global.char[_hpi]]
        }
    }
    if (_totalhp > 0)
        return floor((_totalhp / _totalmaxhp));
    else
        return 0;
}

function scr_retarget_spell() {
    cancelattack = false
    if (star == 0)
    {
        if (global.monster[0] == false)
            star = 1
    }
    if (star == 1)
    {
        if (global.monster[1] == false)
            star = 2
    }
    if (star == 2)
    {
        if (global.monster[2] == false)
            star = 3
        if (star == 3 && global.monster[0] == true)
            star = 0
        if (star == 3 && global.monster[1] == true)
            star = 1
        if (star == 3)
            cancelattack = true
    }
    return;
}

function scr_spare(_monstid) {
    with (global.monsterinstance[argument0])
        event_user(10)
    return;
}

function scr_fakespare() {
    spareanim = instance_create(x, y, obj_fakespare)
    spareanim.sprite_index = sprite_index
    spareanim.sprite_index = sparedsprite
    spareanim.image_index = 0
    spareanim.image_xscale = image_xscale
    spareanim.image_yscale = image_yscale
    spareanim.original = self
    visible = false
    return;
}


function scr_spell(_spell, _caster) {
    spell = argument0
    caster = argument1
    star = global.chartarget[argument1]
    global.spelldelay = 10
    switch spell
    {
        case 0:
            break
        case 1:
            cancelattack = false
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (cancelattack == false)
            {
                damage = ceil(((global.battleat[argument1] * 10) - (global.monsterdf[star] * 3)))
                if (global.automiss[star] == true)
                    damage = 0
                scr_damage_enemy(star, damage)
                attack = instance_create((global.monsterx[star] + random(6)), (global.monstery[star] + random(6)), obj_basicattack)
                attack.sprite_index = spr_attack_mash1
                dm.delay = 8
            }
            global.spelldelay = 30
            break
        case 2:
            healnum = (global.battlemag[argument1] * 5)
            scr_heal(star, healnum)
            global.charinstance[star].healnum = healnum
            with (global.charinstance[star])
            {
                ha = instance_create(x, y, obj_healanim)
                ha.target = id
                dmgwr = scr_dmgwriter_selfchar()
                with (dmgwr)
                {
                    delay = 8
                    type = 3
                }
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3
                }
                dmgwr.damage = healnum
                tu += 1
            }
            global.spelldelay = 15
            break
        case 3:
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (global.monster[star] == true)
            {
                if (global.monsterstatus[star] == true)
                {
                    with (global.monsterinstance[star])
                    {
                        if (global.monstertype[myself] != 19 && global.monstertype[myself] != 3 && global.monstertype[myself] != 52 && global.monstertype[myself] != 43)
                        {
                            if (global.monstertype[myself] == 33)
                                var yoffy = -60
                            else
                                yoffy = 0
                            _pspell = instance_create(global.monsterx[myself], (global.monstery[myself] + yoffy), obj_pacifyspell)
                            _pspell.con = 20
                            _pspell.target = id
                            global.flag[(51 + myself)] = 3
                            event_user(10)
                            scr_monsterdefeat()
                        }
                        else
                        {
                            if (global.monstertype[myself] == 52)
                            {
                                _pspell = instance_create(global.monsterx[myself], global.monstery[myself], obj_pacifyspell)
                                _pspell.con = 20
                                _pspell.target = id
                            }
                            if (global.monstertype[myself] == 43)
                            {
                                _pspell = instance_create(global.monsterx[myself], global.monstery[myself], obj_pacifyspell)
                                _pspell.con = 20
                                _pspell.target = id
                                global.flag[(51 + myself)] = 3
                                with (obj_berdlyb_enemy)
                                    endcon = 1
                                return;
                            }
                            pacifycon = 1
                            global.spelldelay = 999
                        }
                    }
                }
                else
                {
                    if (global.monstertype[myself] == 52)
                        pacifycon = -2
                    _pspell = instance_create(0, 0, obj_pacifyspell)
                    _pspell.target = global.monsterinstance[star]
                    _pspell.fail = 1
                }
            }
            global.spelldelay = 20
            break
        case 4:
            cancelattack = false
            global.spelldelay = 30
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (cancelattack == false)
            {
                global.spelldelay = 70
                damage = ceil((((global.battlemag[argument1] * 5) + (global.battleat[argument1] * 11)) - (global.monsterdf[star] * 3)))
                if (global.automiss[star] == true)
                    damage = 0
                attack = instance_create(obj_herosusie.x, obj_herosusie.y, obj_rudebuster_anim)
                attack.damage = damage
                attack.star = star
                attack.caster = caster
                attack.target = global.monsterinstance[star]
            }
            break
        case 5:
            cancelattack = false
            global.spelldelay = 30
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (cancelattack == false)
            {
                global.spelldelay = 70
                damage = ceil((((global.battlemag[argument1] * 6) + (global.battleat[argument1] * 13)) - (global.monsterdf[star] * 6)))
                if (global.automiss[star] == true)
                    damage = 0
                attack = instance_create(obj_herosusie.x, obj_herosusie.y, obj_rudebuster_anim)
                attack.damage = damage
                attack.star = star
                attack.caster = caster
                attack.target = global.monsterinstance[star]
                attack.red = 1
            }
            break
        case 6:
            healnum = ceil((global.battlemag[argument1] * 5.5))
            for (i = 0; i < 3; i += 1)
            {
                scr_heal(i, healnum)
                global.charinstance[i].healnum = healnum
                with (global.charinstance[i])
                {
                    ha = instance_create(x, y, obj_healanim)
                    ha.target = id
                    dmgwr = scr_dmgwriter_selfchar()
                    with (dmgwr)
                    {
                        delay = 8
                        type = 3
                    }
                    if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                    {
                        with (dmgwr)
                            specialmessage = 3
                    }
                    dmgwr.damage = healnum
                    tu += 1
                }
            }
            global.spelldelay = 15
            break
        case 8:
            var _mistcount = 0
            for (_spelli = 0; _spelli < 3; _spelli++)
            {
                if (global.monster[_spelli] == true)
                {
                    with (global.monsterinstance[_spelli])
                    {
                        _icemist = instance_create(global.monsterx[myself], global.monstery[myself], obj_spell_mist)
                        _icemist.target = id
                        _icemist.myself = myself
                        _icemist.initdelay = (_mistcount * 10)
                        _mistcount++
                    }
                }
            }
            global.spelldelay = (20 + (_mistcount * 10))
            break
        case 9:
            cancelattack = false
            global.spelldelay = 30
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (cancelattack == false)
            {
                global.flag[925] = (global.flag[925] + 1)
                var minbattlemag = clamp((global.battlemag[argument1] - 10), 1, 999)
                global.spelldelay = 40
                damage = ceil((((minbattlemag * 30) + 90) + random(10)))
                attack = instance_create(global.monsterx[star], global.monstery[star], obj_icespell)
                attack.damage = damage
                attack.star = star
                attack.caster = caster
                attack.target = global.monsterinstance[star]
            }
            break
        case 10:
            cancelattack = false
            global.spelldelay = 30
            if (scr_monsterpop() == 0)
                cancelattack = true
            if (cancelattack == false)
            {
                global.spelldelay = 30
                damage = ceil(((global.battlemag[argument1] * 40) + 600))
                attack = instance_create(x, y, obj_spell_snowgrave)
                attack.caster = caster
                attack.damage = damage
                global.spelldelay = 140
                if instance_exists(obj_berdlyb2_enemy)
                {
                    global.spelldelay = 999999
                    attack.textwait = true
                }
            }
            break
        case 11:
            healnum = (global.battlemag[argument1] + 1)
            scr_heal(star, healnum)
            global.charinstance[star].healnum = healnum
            with (global.charinstance[star])
            {
                ha = instance_create(x, y, obj_healanim)
                ha.target = id
                dmgwr = scr_dmgwriter_selfchar()
                with (dmgwr)
                {
                    delay = 8
                    type = 3
                }
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3
                }
                dmgwr.damage = healnum
                tu += 1
            }
            global.spelldelay = 15
            if (global.encounterno == 50)
            {
                if i_ex(obj_omawaroid_enemy)
                    obj_omawaroid_enemy.ultimatehealprompt = 1
            }
            break
        case 100:
            if (global.monster[star] == false)
                scr_retarget_spell()
            if (global.monster[star] == true)
            {
                if (global.mercymod[star] >= 100)
                {
                    if (global.monstertype[star] != 3 && global.monstertype[star] != 52)
                    {
                        with (global.monsterinstance[star])
                        {
                            global.flag[(51 + myself)] = 2
                            event_user(10)
                            scr_monsterdefeat()
                        }
                    }
                    else
                    {
                        with (global.monsterinstance[star])
                            sparecon = 1
                    }
                }
                else
                {
                    scr_mercyadd(star, global.sparepoint[star])
                    _pspell = instance_create(0, 0, obj_pacifyspell)
                    _pspell.target = global.monsterinstance[star]
                    _pspell.fail = 1
                    _pspell.flashcolor = c_yellow
                }
            }
            global.spelldelay = 0
            break
        case 200:
            break
        case 201:
            scr_healitemspell(40)
            break
        case 202:
            reviveamt = ceil((global.maxhp[global.char[star]] / 2))
            if (global.hp[global.char[star]] <= 0)
                reviveamt = (ceil(global.maxhp[global.char[star]]) + abs(global.hp[global.char[star]]))
            scr_healitemspell(reviveamt)
            break
        case 203:
            break
        case 204:
            break
        case 205:
            scr_healitemspell(20)
            break
        case 206:
            scr_healallitemspell(160)
            break
        case 207:
            var healamount = (global.chapter == 1 ? 80 : 140)
            scr_healallitemspell(healamount)
            break
        case 208:
            scr_healitemspell(70)
            break
        case 209:
            scr_healitemspell(50)
            break
        case 210:
            scr_healitemspell(4)
            break
        case 211:
            scr_healallitemspell(70)
            break
        case 212:
            if (global.char[star] == 1)
                scr_healitemspell(20)
            if (global.char[star] == 2)
                scr_healitemspell(80)
            if (global.char[star] == 3)
                scr_healitemspell(50)
            if (global.char[star] == 4)
                scr_healitemspell(30)
            break
        case 213:
            if (global.char[star] == 1)
                scr_healitemspell(80)
            if (global.char[star] == 2)
                scr_healitemspell(20)
            if (global.char[star] == 3)
                scr_healitemspell(50)
            if (global.char[star] == 4)
                scr_healitemspell(70)
            break
        case 214:
            scr_healitemspell(500)
            break
        case 215:
            scr_healitemspell(50)
            break
        case 216:
            scr_healitemspell(80)
            break
        case 217:
            break
        case 218:
            scr_healitemspell(scr_teaamount(1, global.char[star]))
            break
        case 219:
            scr_healitemspell(scr_teaamount(4, global.char[star]))
            break
        case 220:
            scr_healitemspell(scr_teaamount(3, global.char[star]))
            break
        case 221:
            scr_healitemspell(scr_teaamount(2, global.char[star]))
            break
        case 222:
            scr_healitemspell(60)
            break
        case 223:
            scr_healitemspell(120)
            break
        case 224:
            scr_healitemspell(100)
            break
        case 225:
            scr_healallitemspell(30)
            break
        case 226:
            healamount = (global.char[star] == 1 ? 100 : 90)
            scr_healitemspell(healamount)
            break
        case 227:
            break
        case 228:
            break
        case 229:
            break
        case 230:
            healamount = 10
            for (var __j = 0; __j < 3; __j++)
            {
                if (global.char[__j] > 0)
                {
                    healamount = 10
                    star = __j
                    if (global.hp[global.char[star]] <= 0)
                        healamount = (ceil((global.maxhp[global.char[star]] / 4)) + abs(global.hp[global.char[star]]))
                    scr_healitemspell(healamount)
                }
            }
            break
        case 231:
            healamount = 50
            for (__j = 0; __j < 3; __j++)
            {
                if (global.char[__j] > 0)
                {
                    healamount = 50
                    star = __j
                    if (global.hp[global.char[star]] <= 0)
                        healamount = 999
                    scr_healitemspell(healamount)
                }
            }
            break
        case 232:
            if i_ex(global.charinstance[star])
                global.charinstance[star].poisonamount = 60
            snd_play(snd_hurt1)
            var healanim = scr_healitemspell(40)
            healanim.particlecolor = c_fuchsia
            break
        case 233:
            break
        default:

    }

    return;
}

