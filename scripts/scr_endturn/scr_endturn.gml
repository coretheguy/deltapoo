function scr_monsterpop() {
    return ((global.monster[0] + global.monster[1]) + global.monster[2]);
}

function scr_endcombat() {
    global.fighting = false
    if (global.specialbattle == 0 || global.specialbattle == 2 || global.specialbattle == 3)
    {
        if (global.specialbattle == 2)
        {
            with (obj_mainchara)
            {
                cutscene = true
                x = global.charinstance[0].x
                y = global.charinstance[0].y
            }
            with (global.cinstance[0])
            {
                x = global.charinstance[1].x
                y = global.charinstance[1].y
            }
            with (global.cinstance[1])
            {
                x = global.charinstance[2].x
                y = global.charinstance[2].y
            }
            with (obj_caterpillarchara)
                scr_caterpillar_interpolate()
            scr_pan_to_obj(obj_mainchara, 30)
            with (obj_mainchara)
                visible = true
            with (obj_caterpillarchara)
                visible = true
        }
        instance_create(0, 0, obj_endbattle)
        with (obj_monsterparent)
            instance_destroy()
        with (obj_bulletparent)
            instance_destroy()
        with (obj_heroparent)
            instance_destroy()
        global.charinstance[0] = obj_mainchara
        global.charinstance[1] = global.cinstance[0]
        global.charinstance[2] = global.cinstance[1]
        instance_destroy()
    }
    return;
}


function scr_endturn() {
    for (i = 0; i < 12; i += 1)
        global.item[i] = tempitem[i][global.charturn]
    for (i = 0; i < 12; i += 1)
    {
        for (j = 0; j < 3; j += 1)
            tempitem[i][j] = global.item[i]
    }
    moveswapped = false
    with (obj_writer)
        instance_destroy()
    with (obj_face)
        instance_destroy()
    with (obj_smallface)
        instance_destroy()
    global.attacking = false
    for (i = 0; i < 3; i += 1)
    {
        global.monsterattackname[i] = " "
        if (global.charauto[global.char[i]] == true && global.hp[global.char[i]] > 0)
        {
            if (global.monster[2] == true)
                global.chartarget[i] = 2
            if (global.monster[1] == true)
                global.chartarget[i] = 1
            if (global.monster[0] == true)
                global.chartarget[i] = 0
        }
        if (global.charaction[i] == 1)
            global.attacking = true
    }
    __noactors = true
    if (global.acting[0] == true)
        __noactors = false
    for (__noactorsi = 0; __noactorsi < 3; __noactorsi++)
    {
        if (global.actingsingle[__noactorsi] == true)
            __noactors = false
    }
    if (__noactors == true)
        scr_attackphase()
    else
    {
        global.charturn = 3
        global.myfight = 3
        global.currentactingchar = 0
        if (global.acting[0] == false)
            scr_nextact()
        //if (global.chapter == 2 && instance_exists(obj_sweet_enemy) && global.actingsingle[0] == true && global.actingsingle[1] == false && global.actingsingle[2] == false)
        //    obj_sweet_enemy.simultotal_funny = true
        if (global.acting[0] == true && global.actingsimul[0] == true)
            scr_act_simul()
    }
    with (obj_battlecontroller)
    {
        messagepriority = -1
        attackpriority = -1
    }
    return;
}

function scr_mnendturn() {
    if (global.char[0] == 2)
        sus = 0
    if (global.char[1] == 2)
        sus = 1
    if (global.char[2] == 2)
        sus = 2
    techwon = false
    if (scr_monsterpop() == 0)
        techwon = true
    if (global.flag[39] == 1)
        techwon = true
    if (techwon == true)
        scr_wincombat()
    if (techwon == false)
    {
        with (obj_battlecontroller)
        {
            messagepriority = -1
            attackpriority = -1
        }
        scr_battlecursor_memory_reset()
        global.mnfight = 0
        global.myfight = 0
        global.bmenuno = 0
        global.charturn = 0
        skip = false
        for (i = 0; i < 3; i += 1)
        {
            global.hittarget[i] = 0
            with (global.charinstance[i])
                tu = 0
            hptarget = global.char[i]
            if (global.char[i] != 0 && global.hp[hptarget] <= 0)
            {
                healamt = ceil((global.maxhp[hptarget] / 8))
                dmgwr = instance_create(global.charinstance[i].x, ((global.charinstance[i].y + global.charinstance[i].myheight) - 24), obj_dmgwriter)
                with (dmgwr)
                {
                    delay = 1
                    type = 3
                }
                dmgwr.damage = scr_heal(i, healamt)
                if (global.hp[hptarget] >= 1)
                {
                    with (dmgwr)
                        specialmessage = 4
                }
            }
        }
        if (global.charmove[0] == false || global.charauto[global.char[0]] == true)
            global.charturn = 1
        if (global.charturn == 1)
        {
            if (global.charmove[1] == false || global.charauto[global.char[1]] == true)
                global.charturn = 2
        }
        if (global.charturn == 2)
        {
            if (global.charmove[2] == false || global.charauto[global.char[2]] == true)
                skip = true
        }
        for (i = 0; i < 3; i += 1)
        {
            global.acting[i] = false
            global.actingsingle[i] = false
            global.actingsimul[i] = false
            global.actingtarget[i] = 0
            global.temptension[i] = global.tension
            global.charspecial[i] = 0
            global.targeted[i] = false
            global.charaction[i] = 0
            global.faceaction[i] = 0
            global.monsterattackname[i] = " "
        }
        global.currentactingchar = 0
        with (obj_monsterparent)
        {
            attacked = false
            talked = false
            acting = false
            actingsus = false
            actingral = false
            actingnoe = false
        }
        if (skip == true)
        {
            if (global.char[0] == 2 && global.charauto[2] == true)
            {
                global.acting[0] = true
                global.myfight = 3
            }
            scr_endturn()
        }
        for (i = 0; i < 12; i += 1)
        {
            for (j = 0; j < 3; j += 1)
                tempitem[i][j] = global.item[i]
        }
    }
    return;
}

function scr_nextact() {
    global.acting[0] = false
    global.acting[1] = false
    global.acting[2] = false
    global.actingsingle[global.currentactingchar] = false
    __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]]
    with (__minstance)
    {
        acting = false
        actcon = 0
        actconsus = 0
        actconral = 0
        actconnoe = 0
    }
    var singleactcomplete = 0
    while (global.currentactingchar < 3)
    {
        global.currentactingchar++
        if (global.currentactingchar < 3)
        {
            if (global.actingsingle[global.currentactingchar] == true)
            {
                __minstance = global.monsterinstance[global.actingtarget[global.currentactingchar]]
                if (global.char[global.currentactingchar] == 2)
                {
                    with (__minstance)
                        actconsus = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else if (global.char[global.currentactingchar] == 3)
                {
                    with (__minstance)
                        actconral = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else if (global.char[global.currentactingchar] == 4)
                {
                    with (__minstance)
                        actconnoe = 1
                    if (global.actingsimul[global.currentactingchar] == false)
                        singleactcomplete = 1
                    break
                }
                else
                    continue
            }
            else
                continue
        }
        else
            continue
    }
    if (global.currentactingchar >= 3)
    {
        with (obj_monsterparent)
        {
            acting = false
            actingsus = false
            actingral = false
            actingnoe = false
        }
        global.currentactingchar = 0
        scr_attackphase()
    }
    else if (!singleactcomplete)
        scr_act_simul()
    return;
}

function scr_attackphase() {
    with (obj_battlecontroller)
    {
        techwon = false
        if (scr_monsterpop() == 0)
            techwon = true
        //if (global.chapter == 2 && i_ex(obj_berdlyb_enemy) && obj_berdlyb_enemy.endcon == 1)
        //    techwon = true
        else if (techwon == true)
            scr_wincombat()
        if (techwon == false)
        {
            for (__hiti = 0; __hiti < 3; __hiti++)
                global.hittarget[__hiti] = 0
            fightphase = 1
            global.charturn = 3
            if (global.charaction[0] == 4 || global.charaction[0] == 2)
                fightphase = 0
            if (global.charaction[1] == 4 || global.charaction[1] == 2)
                fightphase = 0
            if (global.charaction[2] == 4 || global.charaction[2] == 2)
                fightphase = 0
            if (global.myfight == 4)
                fightphase = 1
            if (fightphase == 1)
            {
                global.myfight = 1
                instance_create((xx + 2), (yy + 365), obj_attackpress)
            }
            else
            {
                global.myfight = 4
                instance_create(0, 0, obj_spellphase)
            }
        }
    }
    return;
}



function scr_act_simul() {
    __simulcount = 0
    for (__ii = global.currentactingchar; __ii < 3; __ii++)
    {
        __foundsimul = 0
        if (global.actingsingle[__ii] == true && instance_exists(obj_monsterparent))
        {
            if (global.char[__ii] == 1 && global.actsimul[global.actingtarget[__ii]][global.actingchoice[__ii]] == true)
            {
                obj_monsterparent.simulorderkri = __simulcount
                with (global.monsterinstance[global.actingtarget[__ii]])
                    actcon = 0
                __foundsimul = 1
            }
            if (global.char[__ii] == 2 && global.actsimulsus[global.actingtarget[__ii]][global.actingchoice[__ii]] == true)
            {
                obj_monsterparent.simulordersus = __simulcount
                with (global.monsterinstance[global.actingtarget[__ii]])
                    actconsus = 1
                __foundsimul = 1
            }
            if (global.char[__ii] == 3 && global.actsimulral[global.actingtarget[__ii]][global.actingchoice[__ii]] == true)
            {
                obj_monsterparent.simulorderral = __simulcount
                with (global.monsterinstance[global.actingtarget[__ii]])
                    actconral = 1
                __foundsimul = 1
            }
            if (global.char[__ii] == 4 && global.actsimulnoe[global.actingtarget[__ii]][global.actingchoice[__ii]] == true)
            {
                obj_monsterparent.simulordernoe = __simulcount
                with (global.monsterinstance[global.actingtarget[__ii]])
                    actconnoe = 1
                __foundsimul = 1
            }
            if __foundsimul
            {
                global.actingsingle[__ii] = false
                __simulcount++
            }
            obj_monsterparent.simultotal = __simulcount
        }
    }
    return;
}

