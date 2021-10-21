function scr_terminate_writer() {
    __writerkilled = 0
    __writerkillable = 0
    __writerended = 0
    if instance_exists(obj_writer)
    {
        obj_writer.__endcheckid = id
        with (obj_writer)
        {
            if (reachedend == 1)
            {
                with (__endcheckid)
                    __writerended++
            }
        }
        if (__writerended == instance_number(obj_writer))
            __writerkillable = 1
    }
    else
        __writerkilled = 1
    if (button1_p() && __writerkillable == 1)
    {
        with (obj_writer)
            instance_destroy()
        __writerkilled = 1
    }
    return __writerkilled;
}

function scr_simultext(char) {
    __simulorder = 0
    if (argument0 == "kris")
        __simulorder = simulorderkri
    if (argument0 == "susie")
        __simulorder = simulordersus
    if (argument0 == "ralsei")
        __simulorder = simulorderral
    if (argument0 == "noelle")
        __simulorder = simulordernoe
    __yoffset = (__simulorder * 30)
    global.typer = 4
    battlewriter = instance_create((xx + 30), ((yy + 376) + __yoffset), obj_writer)
    return;
}

function scr_battletext_default() {
    global.fc = 0
    global.typer = 4
    scr_battletext()
    return battlewriter;
}

function scr_mercyadd(enid, amt) {
    global.mercymod[argument0] += argument1
    if (global.mercymod[argument0] < 0)
        global.mercymod[argument0] = 0
    if (global.mercymod[argument0] >= 100)
        global.mercymod[argument0] = 100
    var _playsound = true
    if (argument1 <= 0)
        _playsound = false
    if i_ex(obj_dmgwriter)
    {
        with (obj_dmgwriter)
        {
            if (type == 5)
                _playsound = false
        }
    }
    if _playsound
    {
        var _pitch = 0.8
        if (argument1 < 99)
            _pitch = 1
        if (argument1 <= 50)
            _pitch = 1.2
        if (argument1 <= 25)
            _pitch = 1.4
        snd_play_x(snd_mercyadd, 0.8, _pitch)
    }
    __mercydmgwriter = instance_create(global.monsterx[argument0], ((global.monstery[argument0] + 20) - (global.hittarget[argument0] * 20)), obj_dmgwriter)
    __mercydmgwriter.damage = argument1
    __mercydmgwriter.type = 5
    global.hittarget[argument0] = (global.hittarget[argument0] + 1)
    return;
}

function scr_blconskip(sk) {
    if (argument0 >= 0)
    {
        if (button1_p() && talktimer > argument0)
            talktimer = talkmax
        talktimer += 1
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy()
            global.mnfight = 2
        }
    }
    else if (argument0 == -1)
    {
        if (instance_exists(obj_writer) == 0)
            global.mnfight = 2
    }
    else if (argument0 == -2)
    {
        talktimer += 1
        if (talktimer > 15)
            talktimer = talkmax
        if (talktimer >= talkmax)
        {
            with (obj_writer)
                instance_destroy()
            global.mnfight = 2
        }
    }
    return;
}



function scr_enemyblcon(xx, yy, con) {
    if (argument2 == 0)
    {
        mywriter = instance_create(argument0, argument1, obj_writer)
        return mywriter;
    }
    if (argument2 == 1)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        return myblcon;
    }
    if (argument2 == 2)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_v
        return myblcon;
    }
    if (argument2 == 3)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        return myblcon;
    }
    if (argument2 == 4)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 0
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 5)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 1
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 6)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 7)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_r
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 8)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_tall
        return myblcon;
    }
    if (argument2 == 10)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        myblcon.auto_length = true
        return myblcon;
    }
    return;
}

function scr_moveheart() {
    global.inv = 0
    if (global.chapter == 2 && instance_exists(obj_gigaqueen_enemy))
        return instance_create((o_boxingcontroller.x + 4), (o_boxingcontroller.y - 120), obj_moveheart);
    else
        return instance_create((obj_herokris.x + 10), (obj_herokris.y + 40), obj_moveheart);
}

function scr_messagepriority(pri) {
    if i_ex(obj_battlecontroller)
    {
        if (obj_battlecontroller.messagepriority < argument0)
        {
            obj_battlecontroller.messagepriority = argument0
            return 1;
        }
        else
            return 0;
    }
    else
        return 0;
}

function scr_spelltext(_spell, _caster) {
    spell = argument0
    caster = argument1
    star = global.chartarget[argument1]
    spelltext = " "
    switch spell
    {
        case 0:
            break
        case 1:
            global.msg[0] = stringsetsubloc("* ~1 cast RUDE BUSTER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_14_0")
            break
        case 2:
            global.msg[0] = stringsetsubloc("* ~1 cast HEAL PRAYER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_18_0")
            break
        case 3:
            global.msg[0] = stringsetsubloc("* ~1 cast PACIFY!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_23_0")
            scr_retarget_spell()
            if (global.monster[star] == true)
            {
                if (global.monsterstatus[star] == true)
                {
                }
                else
                {
                    global.msg[0] = stringsetsubloc("* ~1 cast PACIFY^1!&* But the enemy wasn't \\cBTIRED\\cW.../%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_33_0")
                    if (global.mercymod[star] >= 100)
                        global.msg[0] = stringsetsubloc("* ~1 cast PACIFY^1!&* But the foe wasn't \\cBTIRED\\cW... try \\cYSPARING\\cW!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_36_0")
                }
            }
            break
        case 4:
            global.msg[0] = stringsetsubloc("* ~1 used RUDE BUSTER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_43_0")
            break
        case 5:
            global.msg[0] = stringsetsubloc("* ~1 used RED BUSTER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_47_0")
            break
        case 6:
            global.msg[0] = stringsetsubloc("* ~1 cast DUAL HEAL!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_51_0")
            break
        case 8:
            global.msg[0] = stringsetsubloc("* ~1 cast SLEEPMIST!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_55_0")
            break
        case 9:
            global.msg[0] = stringsetsubloc("* ~1 cast ICESHOCK!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_59_0")
            break
        case 10:
            global.msg[0] = stringsetsubloc("* ~1 cast SNOWGRAVE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_63_0")
            break
        case 11:
            global.msg[0] = stringsetsubloc("* ~1 cast ULTIMATEHEAL!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_67_0")
            break
        case 100:
            cancelattack = false
            global.msg[0] = stringsetsubloc("* ~1 spared ~2!/%", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_58_0")
            scr_retarget_spell()
            if (global.mercymod[star] >= 100)
                global.msg[0] = stringsetsubloc("* ~1 spared ~2!/%", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_62_0")
            else
            {
                global.msg[0] = stringsetsubloc("* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../%", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_66_0")
                if (global.monsterstatus[star] == true)
                {
                    if scr_havechar(3)
                    {
                        global.msg[0] = stringsetsubloc("* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_69_0")
                        global.msg[1] = stringsetloc("* (Try using Ralsei's \\cBPACIFY\\cW!)/%", "scr_spelltext_slash_scr_spelltext_gml_70_0")
                    }
                    else if scr_havechar(4)
                    {
                        msgsetsubloc(0, "* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_94_0")
                        msgnextloc("* (Try using Noelle's \\cBSLEEPMIST\\cW!)/%", "scr_spelltext_slash_scr_spelltext_gml_95_0")
                    }
                    else
                    {
                        msgsetsubloc(0, "* ~1 spared ~2^2!&* But its name wasn't \\cYYELLOW\\cW.../", global.charname[global.char[caster]], global.monstername[star], "scr_spelltext_slash_scr_spelltext_gml_99_0")
                        msgnextloc("* (Try using \\cBACTs\\cW!)/%", "scr_spelltext_slash_scr_spelltext_gml_100_0_b")
                    }
                }
            }
            if (cancelattack == true)
                global.msg[0] = stringsetsubloc("* ~1 spared!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_73_0")
            break
        case 201:
            global.msg[0] = stringsetsubloc("* ~1 used the DARK CANDY!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_78_0")
            break
        case 202:
            global.msg[0] = stringsetsubloc("* ~1 used the REVIVEMINT!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_100_0")
            break
        case 203:
            global.msg[0] = stringsetsubloc("* ~1 used the GLOWSHARD!/", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_86_0")
            global.msg[1] = stringsetloc("* But nothing happened.../%", "scr_spelltext_slash_scr_spelltext_gml_87_0")
            spec_shard = 0
            for (_en = 0; _en < 3; _en += 1)
            {
                shardtest[_en] = 0
                if (global.monster[_en] == true)
                {
                    if (global.monstertype[_en] == 5)
                    {
                        spec_shard = 1
                        shardtest[_en] = 1
                        global.mercymod[_en] = 200
                    }
                }
            }
            if (spec_shard > 0)
            {
                scr_itemshift(global.bmenucoord[4][argument1], 0)
                global.msg[1] = stringsetloc("", "scr_spelltext_slash_scr_spelltext_gml_126_0")
                global.msg[2] = stringsetloc("* The GLOWSHARD disappeared!/%", "scr_spelltext_slash_scr_spelltext_gml_109_0")
                for (_j = 0; _j < 3; _j += 1)
                {
                    if (shardtest[_j] == 1)
                        global.msg[1] += (("* " + global.monstername[_j]) + stringsetloc(" became enraptured!&", "scr_spelltext_slash_scr_spelltext_gml_143_0"))
                }
                global.msg[1] += "/"
            }
            break
        case 204:
            global.msg[0] = stringsetsubloc("* ~1 read the MANUAL!/", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_122_0")
            global.msg[1] = stringsetloc("* But nothing happened.../%", "scr_spelltext_slash_scr_spelltext_gml_123_0")
            spec_shard = 0
            for (_en = 0; _en < 3; _en += 1)
            {
                shardtest[_en] = 0
                if (global.monster[_en] == true)
                {
                    if (global.monstertype[_en] == 5)
                    {
                        spec_shard = 1
                        shardtest[_en] = 1
                        global.monsterstatus[_en] = true
                        global.monstercomment[_en] = stringsetloc("(Tired)", "scr_spelltext_slash_scr_spelltext_gml_166_0")
                    }
                    if (global.monstertype[_en] == 6)
                    {
                        spec_shard = 1
                        shardtest[_en] = 2
                    }
                    if (global.monstertype[_en] == 7 || global.monstertype[_en] == 16)
                    {
                        spec_shard = 1
                        shardtest[_en] = 3
                        with (global.monsterinstance[_en])
                        {
                            battlecancel = 1
                            if (manual == 0)
                            {
                                manual = 1
                                scr_mercyadd(myself, 50)
                            }
                        }
                    }
                }
            }
            if (spec_shard > 0)
            {
                global.msg[1] = stringsetloc("", "scr_spelltext_slash_scr_spelltext_gml_182_0")
                for (_j = 0; _j < 3; _j += 1)
                {
                    if (shardtest[_j] == 1)
                        global.msg[1] += (("* " + global.monstername[_j]) + stringsetloc(" was \\cBbored to tears\\cW!&", "scr_spelltext_slash_scr_spelltext_gml_199_0"))
                    if (shardtest[_j] == 2)
                        global.msg[1] += (("* " + global.monstername[_j]) + stringsetloc(" listened politely!&", "scr_spelltext_slash_scr_spelltext_gml_200_0_b"))
                    if (shardtest[_j] == 3)
                        global.msg[1] += (("* " + global.monstername[_j]) + stringsetloc(" became sentimental!&", "scr_spelltext_slash_scr_spelltext_gml_201_0"))
                }
                global.msg[1] += "/%"
            }
            break
        case 205:
            global.msg[0] = stringsetsubloc("* ~1 used the BROKEN CAKE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_179_0")
            break
        case 206:
            global.msg[0] = stringsetsubloc("* ~1 used the TOPCAKE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_183_0")
            break
        case 207:
            global.msg[0] = stringsetsubloc("* ~1 used the SPINCAKE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_187_0")
            break
        case 208:
            global.msg[0] = stringsetsubloc("* ~1 used the DARKBURGER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_191_0")
            break
        case 209:
            global.msg[0] = stringsetsubloc("* ~1 used the LANCERCOOKIE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_194_0")
            break
        case 210:
            global.msg[0] = stringsetsubloc("* ~1 used the GIGASALAD!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_197_0")
            break
        case 211:
            global.msg[0] = stringsetsubloc("* ~1 used the CLUBS SANDWICH!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_200_0")
            break
        case 212:
            global.msg[0] = stringsetsubloc("* ~1 used the HEARTS DONUT!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_203_0")
            break
        case 213:
            global.msg[0] = stringsetsubloc("* ~1 used the CHOCO DIAMOND!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_206_0")
            break
        case 214:
            global.msg[0] = stringsetsubloc("* ~1 used the FAV SANDWICH!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_209_0")
            break
        case 215:
            global.msg[0] = stringsetsubloc("* ~1 used the ROUXLS ROUX!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_230_0")
            break
        case 216:
            msgsetsubloc(0, "* ~1 used the CD BAGEL!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_233_0")
            break
        case 217:
            msgsetsubloc(0, "* ~1 used the CLOTHESDOLL!/", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_236_0")
            msgnextloc("* ... but nothing happened!/%", "scr_spelltext_slash_scr_spelltext_gml_237_0")
            break
        case 218:
            msgsetsubloc(0, "* ~1 used the KRIS TEA!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_240_0")
            break
        case 219:
            msgsetsubloc(0, "* ~1 used the NOELLE TEA!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_243_0")
            break
        case 220:
            msgsetsubloc(0, "* ~1 used the RALSEI TEA!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_246_0")
            break
        case 221:
            msgsetsubloc(0, "* ~1 used the SUSIE TEA!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_249_0")
            break
        case 222:
            msgsetsubloc(0, "* ~1 used the DD-BURGER!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_252_0")
            break
        case 223:
            msgsetsubloc(0, "* ~1 used the LIGHTCANDY!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_255_0")
            break
        case 224:
            msgsetsubloc(0, "* ~1 used the BUTJUICE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_258_0")
            break
        case 225:
            msgsetsubloc(0, "* ~1 used the SPAGHETTICODE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_261_0")
            break
        case 226:
            msgsetsubloc(0, "* ~1 used the JAVACOOKIE!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_264_0")
            break
        case 227:
            msgsetsubloc(0, "* ~1 used the TENSIONBIT!&* Tension raised up earlier./%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_267_0")
            break
        case 228:
            msgsetsubloc(0, "* ~1 used the TENSIONGEM!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_270_0")
            break
        case 229:
            msgsetsubloc(0, "* ~1 used the TENSIONMAX!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_273_0")
            break
        case 230:
            msgsetsubloc(0, "* ~1 used the REVIVEDUST!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_276_0")
            break
        case 231:
            msgsetsubloc(0, "* ~1 used the REVIVEBRIGHT!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_279_0")
            break
        case 232:
            msgsetsubloc(0, "* ~1 administered S.POISON!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_282_0")
            break
        case 233:
            msgsetsubloc(0, "* ~1 admired DOGDOLLAR!/%", global.charname[global.char[caster]], "scr_spelltext_slash_scr_spelltext_gml_298_0")
            break
        default:

    }

    return;
}