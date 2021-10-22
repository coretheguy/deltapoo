function scr_encountersetup(encounter ) {
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    for (i = 0; i < 3; i += 1)
    {
        global.heromakex[i] = (xx + 80)
        global.heromakey[i] = ((yy + 50) + (80 * i))
        global.monsterinstancetype[i] = obj_baseenemy
        global.monstertype[i] = 1
        global.monstermakex[i] = ((xx + 500) + (20 * i))
        global.monstermakey[i] = ((yy + 40) + (90 * i))
    }
    global.monstertype[1] = 0
    global.monstertype[2] = 0
    if (global.char[0] != 0 && global.char[1] == 0 && global.char[2] == 0)
        global.heromakey[0] = (yy + 140)
    if (global.char[0] != 0 && global.char[1] != 0 && global.char[2] == 0)
    {
        global.heromakey[0] = (yy + 100)
        global.heromakey[1] = (yy + 180)
    }
    global.battlemsg[0] = stringsetloc("* It is known.", "scr_encountersetup_slash_scr_encountersetup_gml_34_0")
    switch argument0
    {
        case 0:
            break
        case 1:
            global.monsterinstancetype[0] = obj_baseenemy
            global.monstertype[0] = 1
            global.monstermakex[0] = (xx + 480)
            global.monstermakey[0] = (yy + 110)
            global.monsterinstancetype[1] = obj_baseenemy
            global.monstertype[1] = 1
            global.monstermakex[1] = (xx + 500)
            global.monstermakey[1] = (yy + 200)
            global.monstertype[2] = 0
            global.battlemsg[0] = stringsetloc("* Test enemies showed up.", "scr_encountersetup_slash_scr_encountersetup_gml_60_0")
            break
			
		
		case 10:
		
			global.monsterinstancetype[0] = obj_pippins_enemy
			global.monstertype[0] = 8
			global.monstermakex[0] = (xx + 480)
			global.monstermakey[0] = (yy + 60)
			global.battlemsg[0] = stringset("* Pippins rolls the dice.")
			
			break
			
		case 55:
            global.monsterinstancetype[0] = obj_virovirokun_enemy
            global.monstertype[0] = 35
            global.monstermakex[0] = (xx + 480)
            global.monstermakey[0] = (yy + 40)
            global.monsterinstancetype[1] = obj_virovirokun_enemy
            global.monstertype[1] = 35
            global.monstermakex[1] = (xx + 510)
            global.monstermakey[1] = (yy + 154)
            global.monstertype[2] = 0
            global.battlemsg[0] = stringsetloc("* Virovirokun floated in!", "scr_encountersetup_slash_scr_encountersetup_gml_637_0")
            if (global.ambush == 2)
                global.battlemsg[0] = stringsetloc("* First strike!", "scr_encountersetup_slash_scr_encountersetup_gml_640_0")
            break
		
		case 102:
            global.monsterinstancetype[0] = obj_pipis_enemy
            global.monstertype[0] = 53
            global.monstermakex[0] = (xx + 530)
            global.monstermakey[0] = (yy + 100)
            global.monsterinstancetype[1] = obj_pipis_enemy
            global.monstertype[1] = 53
            global.monstermakex[1] = (xx + 448)
            global.monstermakey[1] = (yy + 168)
            global.monsterinstancetype[2] = obj_pipis_enemy
            global.monstertype[2] = 53
            global.monstermakex[2] = (xx + 510)
            global.monstermakey[2] = (yy + 250)
            global.battlemsg[0] = stringsetloc("* Pipis.", "scr_encountersetup_slash_scr_encountersetup_gml_1462_0")
            break	
		
		default:

    }

    return;
}

function scr_monster_actreset(monster) {
    for (__fj = 0; __fj < 6; __fj += 1)
    {
        global.canact[argument0][__fj] = false
        global.actname[argument0][__fj] = " "
        global.actactor[argument0][__fj] = 1
        global.actdesc[argument0][__fj] = " "
        global.actcost[argument0][__fj] = 0
        global.actsimul[argument0][__fj] = false
        global.canactsus[argument0][__fj] = false
        global.actnamesus[argument0][__fj] = " "
        global.actdescsus[argument0][__fj] = " "
        global.actcostsus[argument0][__fj] = 0
        global.actsimulsus[argument0][__fj] = false
        global.canactral[argument0][__fj] = false
        global.actnameral[argument0][__fj] = " "
        global.actdescral[argument0][__fj] = " "
        global.actcostral[argument0][__fj] = 0
        global.actsimulral[argument0][__fj] = false
        global.canactnoe[argument0][__fj] = false
        global.actnamenoe[argument0][__fj] = " "
        global.actdescnoe[argument0][__fj] = " "
        global.actcostnoe[argument0][__fj] = 0
        global.actsimulnoe[argument0][__fj] = false
    }
    return;
}



function scr_monstersetup() {
    scr_monster_actreset(myself)
    if (global.monstertype[myself] == 1)
    {
        global.monstername[myself] = stringsetloc("Enemy", "scr_monstersetup_slash_scr_monstersetup_gml_7_0")
        global.monstermaxhp[myself] = 130
        global.monstermaxhp[myself] = 130
        global.monsterhp[myself] = 130
        global.monsterat[myself] = 7
        global.monsterdf[myself] = 0
        global.monsterexp[myself] = 0
        global.monstergold[myself] = 20
        global.sparepoint[myself] = 10
        global.mercymod[myself] = 0
        global.mercymax[myself] = 100
        global.canact[myself][0] = true
        global.actname[myself][0] = stringsetloc("Check", "scr_monstersetup_slash_scr_monstersetup_gml_19_0")
        global.canact[myself][1] = true
        global.actname[myself][1] = stringsetloc("Warning", "scr_monstersetup_slash_scr_monstersetup_gml_21_0")
        global.canact[myself][2] = true
        global.actname[myself][2] = stringsetloc("Victory", "scr_monstersetup_slash_scr_monstersetup_gml_23_0")
        global.canact[myself][3] = true
        global.actname[myself][3] = stringsetloc("SimuDance", "scr_monstersetup_slash_scr_monstersetup_gml_25_0")
        global.actsimul[myself][3] = true
        global.canact[myself][4] = true
        global.actname[myself][4] = stringsetloc("Victory (S)", "scr_monstersetup_slash_scr_monstersetup_gml_28_0")
        global.canact[myself][5] = true
        global.actname[myself][5] = stringsetloc("Lecture", "scr_monstersetup_slash_scr_monstersetup_gml_30_0")
        global.canactsus[myself][0] = true
        global.actnamesus[myself][0] = stringsetloc("CoolDance", "scr_monstersetup_slash_scr_monstersetup_gml_33_0")
        global.canactsus[myself][1] = true
        global.actnamesus[myself][1] = stringsetloc("SimuDance", "scr_monstersetup_slash_scr_monstersetup_gml_35_0")
        global.actsimulsus[myself][1] = true
        global.canactral[myself][0] = true
        global.actnameral[myself][0] = stringsetloc("CoolDance", "scr_monstersetup_slash_scr_monstersetup_gml_40_0")
        global.canactral[myself][1] = true
        global.actnameral[myself][1] = stringsetloc("SimuDance", "scr_monstersetup_slash_scr_monstersetup_gml_42_0")
        global.actsimulral[myself][1] = true
    }
	
	if (global.monstertype[myself] == 8)
    {
        global.monstername[myself] = stringsetloc("Pippins", "scr_monstersetup_slash_scr_monstersetup_gml_244_0")
        global.monstermaxhp[myself] = 170
        global.monsterhp[myself] = 170
        global.monsterat[myself] = 8
        global.monsterdf[myself] = 0
        global.monsterexp[myself] = 0
        global.monstergold[myself] = 50
        global.sparepoint[myself] = 10
        global.mercymod[myself] = 0
        global.mercymax[myself] = 100
        global.canact[myself][0] = true
        global.actname[myself][0] = stringsetloc("Check", "scr_monstersetup_slash_scr_monstersetup_gml_255_0")
        global.canact[myself][1] = true
        global.actname[myself][1] = stringsetloc("Bet", "scr_monstersetup_slash_scr_monstersetup_gml_257_0")
        global.canact[myself][2] = true
        global.actname[myself][2] = stringsetloc("X-Bet", "scr_monstersetup_slash_scr_monstersetup_gml_259_0")
        global.actactor[myself][2] = 3
    }
	
	if (global.monstertype[myself] == 35)
    {
        global.monstername[myself] = stringsetloc("Virovirokun", "scr_monstersetup_slash_scr_monstersetup_gml_1008_0")
        global.monstermaxhp[myself] = 240
        global.monsterhp[myself] = 240
        global.monsterat[myself] = 8
        global.monsterdf[myself] = 0
        global.monsterexp[myself] = 0
        global.monstergold[myself] = 84
        global.sparepoint[myself] = 20
        global.mercymod[myself] = 0
        global.mercymax[myself] = 100
        global.canact[myself][0] = true
        global.actname[myself][0] = stringsetloc("Check", "scr_monstersetup_slash_scr_monstersetup_gml_1019_0")
        global.canact[myself][1] = true
        global.actname[myself][1] = stringsetloc("TakeCare", "scr_monstersetup_slash_scr_monstersetup_gml_1022_0")
        if (!scr_havechar(4))
        {
            global.canact[myself][2] = true
            global.actactor[myself][2] = 4
            global.actname[myself][2] = stringsetloc("TakeCareX", "scr_monstersetup_slash_scr_monstersetup_gml_1028_0")
            global.actdesc[myself][2] = " "
            global.actcost[myself][2] = 0
        }
        else
        {
            global.canact[myself][2] = true
            global.actactor[myself][2] = 5
            global.actname[myself][2] = stringsetloc("TakeCareX", "scr_monstersetup_slash_scr_monstersetup_gml_1047_0")
            global.actdesc[myself][2] = " "
            global.actcost[myself][2] = 0
        }
        global.canactsus[myself][0] = true
        global.actnamesus[myself][0] = stringsetloc("S-Action", "scr_monstersetup_slash_scr_monstersetup_gml_1053_0")
        global.actsimulsus[myself][0] = true
        global.canactral[myself][0] = true
        global.actnameral[myself][0] = stringsetloc("R-Action", "scr_monstersetup_slash_scr_monstersetup_gml_1057_0")
        global.actsimulral[myself][0] = true
        global.canactnoe[myself][0] = true
        global.actnamenoe[myself][0] = stringsetloc("N-Action", "scr_monstersetup_slash_scr_monstersetup_gml_1061_0")
        global.actsimulnoe[myself][0] = true
    }
	
	return;
}

