function scr_spellinfo(){
    cost = -1
    spelltarget = 1
    spellname = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_3_0")
    spellnameb = " "
    spelldescb = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_5_0")
    spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_6_0")
    spellanim = 0
    spellusable = 0
    spelltext = " "
    switch argument0
    {
        case 0:
            spellname = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_14_0")
            spellnameb = " "
            spelltarget = 0
            cost = -1
            spelldescb = stringsetloc("None", "scr_spellinfo_slash_scr_spellinfo_gml_18_0")
            break
        case 1:
            spellname = stringsetloc("Rude Sword", "scr_spellinfo_slash_scr_spellinfo_gml_21_0")
            spellnameb = stringsetloc("RudeSword", "scr_spellinfo_slash_scr_spellinfo_gml_22_0")
            spelldescb = stringsetloc("Rude#Damage#", "scr_spellinfo_slash_scr_spellinfo_gml_23_0")
            spelldesc = stringsetloc("Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_24_0")
            spelltarget = 2
            cost = 125
            spellusable = 0
            break
        case 2:
            spellname = stringsetloc("Heal Prayer", "scr_spellinfo_slash_scr_spellinfo_gml_31_0")
            spellnameb = stringsetloc("Heal Prayer", "scr_spellinfo_slash_scr_spellinfo_gml_32_0")
            spelldescb = stringsetloc("Heal#Ally", "scr_spellinfo_slash_scr_spellinfo_gml_33_0")
            spelldesc = stringsetloc("Heavenly light restores a little HP to#one party member. Depends on Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_34_0")
            spelltarget = 1
            cost = 80
            usable = 0
            spellusable = 0
            break
        case 3:
            spellname = stringsetloc("Pacify", "scr_spellinfo_slash_scr_spellinfo_gml_42_0")
            spellnameb = stringsetloc("Pacify", "scr_spellinfo_slash_scr_spellinfo_gml_43_0")
            spelldescb = stringsetloc("Spare#TIRED foe", "scr_spellinfo_slash_scr_spellinfo_gml_44_0")
            spelldesc = stringsetloc("SPARE a tired enemy by putting them to sleep.", "scr_spellinfo_slash_scr_spellinfo_gml_45_0")
            spelltarget = 2
            cost = 40
            usable = 0
            spellusable = 0
            break
        case 4:
            spellname = stringsetloc("Rude Buster", "scr_spellinfo_slash_scr_spellinfo_gml_52_0")
            spellnameb = stringsetloc("Rude Buster", "scr_spellinfo_slash_scr_spellinfo_gml_53_0")
            spelldescb = stringsetloc("Rude#Damage#", "scr_spellinfo_slash_scr_spellinfo_gml_54_0")
            spelldesc = stringsetloc("Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_55_0")
            spelltarget = 2
            cost = 125
            if (global.charweapon[2] == 7)
                cost = 100
            spellusable = 0
            break
        case 5:
            spellname = stringsetloc("Red Buster", "scr_spellinfo_slash_scr_spellinfo_gml_64_0")
            spellnameb = stringsetloc("Red Buster", "scr_spellinfo_slash_scr_spellinfo_gml_65_0")
            spelldescb = stringsetloc("Red#Damage#", "scr_spellinfo_slash_scr_spellinfo_gml_66_0")
            spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_67_0")
            spelltarget = 2
            cost = 0
            spellusable = 0
            break
        case 6:
            spellname = stringsetloc("Dual Heal", "scr_spellinfo_slash_scr_spellinfo_gml_75_0")
            spellnameb = stringsetloc("Dual Heal", "scr_spellinfo_slash_scr_spellinfo_gml_76_0")
            spelldescb = stringsetloc("Heal All#30 HP", "scr_spellinfo_slash_scr_spellinfo_gml_77_0")
            spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_78_0")
            spelltarget = 0
            cost = 0
            spellusable = 0
            break
        case 7:
            spellname = stringsetloc("ACT", "scr_spellinfo_slash_scr_spellinfo_gml_86_0")
            spellnameb = stringsetloc("ACT", "scr_spellinfo_slash_scr_spellinfo_gml_87_0")
            spelldescb = stringsetloc("Use#action", "scr_spellinfo_slash_scr_spellinfo_gml_88_0")
            spelldesc = stringsetloc("Do all sorts of things.#It isn't magic.", "scr_spellinfo_slash_scr_spellinfo_gml_89_0")
            spelltarget = 0
            cost = 0
            spellusable = 0
            break
        case 8:
            spellname = stringsetloc("SleepMist", "scr_spellinfo_slash_scr_spellinfo_gml_96_0")
            spellnameb = stringsetloc("Sleep Mist", "scr_spellinfo_slash_scr_spellinfo_gml_97_0")
            spelldescb = stringsetloc("Spare#TIRED foes", "scr_spellinfo_slash_scr_spellinfo_gml_98_0")
            spelldesc = stringsetloc("A cold mist sweeps through,#sparing all TIRED enemies.", "scr_spellinfo_slash_scr_spellinfo_gml_99_0")
            spelltarget = 0
            cost = 80
            spellusable = 0
            break
        case 9:
            spellname = stringsetloc("IceShock", "scr_spellinfo_slash_scr_spellinfo_gml_107_0")
            spellnameb = stringsetloc("IceShock", "scr_spellinfo_slash_scr_spellinfo_gml_108_0")
            spelldescb = stringsetloc("Damage#w/ ICE", "scr_spellinfo_slash_scr_spellinfo_gml_109_0")
            spelldesc = stringsetloc("Deals magical ICE damage to#one enemy.", "scr_spellinfo_slash_scr_spellinfo_gml_110_0")
            spelltarget = 2
            cost = 40
            if (global.charweapon[4] == 13)
                cost *= 0.5
            spellusable = 0
            break
        case 10:
            spellname = stringsetloc("SnowGrave", "scr_spellinfo_slash_scr_spellinfo_gml_121_0")
            spellnameb = stringsetloc("SnowGrave", "scr_spellinfo_slash_scr_spellinfo_gml_122_0")
            spelldescb = stringsetloc("Fatal", "scr_spellinfo_slash_scr_spellinfo_gml_123_0")
            spelldesc = stringsetloc("Deals the fatal damage to#all of the enemies.", "scr_spellinfo_slash_scr_spellinfo_gml_124_0")
            spelltarget = 0
            //if instance_exists(obj_berdlyb2_enemy)
            //{
            //    if (global.flag[924] < 4)
            //        spelltarget = 3
            //    else
            //        spellanim = 1
            //}
            cost = (global.maxtension * 2)
            if (global.charweapon[4] == 13)
                cost *= 0.5
            spellusable = 0
            break
        case 11:
            spellname = stringsetloc("UltimatHeal", "scr_spellinfo_slash_scr_spellinfo_gml_147_0")
            spellnameb = stringsetloc("UltimatHeal", "scr_spellinfo_slash_scr_spellinfo_gml_148_0")
            spelldescb = stringsetloc("Best#healing", "scr_spellinfo_slash_scr_spellinfo_gml_149_0")
            spelldesc = stringsetloc("Heals 1 party member to the#best of Susie's ability.", "scr_spellinfo_slash_scr_spellinfo_gml_150_0")
            spelltarget = 1
            cost = 250
            spellusable = 0
            break
    }

    return;
}

function scr_spellconsumeb(){
    global.tension -= cost
    global.faceaction[global.charturn] = 2
    global.charaction[global.charturn] = 2
    if (global.flag[34] == 1)
        global.charspecial[global.charturn] = global.spell[global.char[global.charturn]][global.bmenucoord[2][global.charturn]]
    if (global.flag[34] == 0)
        global.charspecial[global.charturn] = global.battlespell[global.charturn][global.bmenucoord[2][global.charturn]]
    global.tensionselect = 0
    if (spellanim == true)
    {
        with (global.charinstance[global.charturn])
        {
            spellframes = 0
            spellsprite = spellreadysprite
        }
    }
    else
    {
        with (global.charinstance[global.charturn])
        {
            spellframes = remspellframes
            spellsprite = remspellsprite
        }
    }
    scr_nexthero()
    return;
}

 

function scr_itemconsumeb() {
    global.faceaction[global.charturn] = 3
    global.charaction[global.charturn] = 4
    global.charspecial[global.charturn] = (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] + 200)
    if (usable == true && replaceable == false)
        scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn)
    else if (replaceable > false)
        tempitem[global.bmenucoord[4][global.charturn]][global.charturn] = replaceable
    scr_nexthero()
    return;
}

function scr_itemshift_temp(a1, a2) {
    tempitem[12][argument1] = 0
    for (i = argument0; i < 12; i += 1)
        tempitem[i][argument1] = tempitem[(i + 1)][argument1]
    return;
}

function scr_actinfo_temp(act) {
    for (__acti = 0; __acti < 6; __acti++)
    {
        canact[__acti] = false
        if (global.char[global.charturn] == 1)
        {
            canact[__acti] = global.canact[argument0][__acti]
            acttpcost[__acti] = global.actcost[argument0][__acti]
            actsimul[__acti] = global.actsimul[argument0][__acti]
        }
        if (global.char[global.charturn] == 2)
        {
            canact[__acti] = global.canactsus[argument0][__acti]
            acttpcost[__acti] = global.actcostsus[argument0][__acti]
            actsimul[__acti] = global.actsimulsus[argument0][__acti]
        }
        if (global.char[global.charturn] == 3)
        {
            canact[__acti] = global.canactral[argument0][__acti]
            acttpcost[__acti] = global.actcostral[argument0][__acti]
            actsimul[__acti] = global.actsimulral[argument0][__acti]
        }
        if (global.char[global.charturn] == 4)
        {
            canact[__acti] = global.canactnoe[argument0][__acti]
            acttpcost[__acti] = global.actcostnoe[argument0][__acti]
            actsimul[__acti] = global.actsimulnoe[argument0][__acti]
        }
    }
    return;
}

function scr_actselect(enemy, char) {
    if i_ex(global.monsterinstance[argument0])
    {
        if (global.char[global.charturn] == 1)
            global.monsterinstance[argument0].acting = (argument1 + 1)
        if (global.char[global.charturn] == 2)
            global.monsterinstance[argument0].actingsus = (argument1 + 1)
        if (global.char[global.charturn] == 3)
            global.monsterinstance[argument0].actingral = (argument1 + 1)
        if (global.char[global.charturn] == 4)
            global.monsterinstance[argument0].actingnoe = (argument1 + 1)
    }
    if (global.char[global.charturn] == 1)
    {
        global.actingsimul[0] = actsimul[argument1]
        global.acting[0] = true
        global.actingsingle[0] = true
        global.actingtarget[global.charturn] = argument0
        if (global.actactor[argument0][argument1] == 2)
            global.acting[charpos[1]] = true
        if (global.actactor[argument0][argument1] == 3)
            global.acting[charpos[2]] = true
        if (global.actactor[argument0][argument1] == 4)
        {
            global.acting[2] = true
            global.acting[1] = true
        }
        if (global.actactor[argument0][argument1] == 5)
            global.acting[charpos[3]] = true
        for (i = 0; i < 3; i += 1)
        {
            if (global.acting[i] == true)
            {
                global.faceaction[i] = 6
                global.charaction[i] = 9
            }
        }
    }
    else
    {
        global.actingtarget[global.charturn] = argument0
        global.actingsingle[global.charturn] = true
        global.actingsimul[global.charturn] = actsimul[argument1]
        global.faceaction[global.charturn] = 6
        global.charaction[global.charturn] = 9
    }
    return;
}



