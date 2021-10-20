function scr_monster_makeinstance(monst_id) {
    global.monster[argument0] = true
    with (global.monsterinstance[argument0])
        instance_destroy()
    global.monsterinstance[argument0] = instance_create(global.monstermakex[argument0], global.monstermakey[argument0], global.monsterinstancetype[argument0])
    global.monsterinstance[argument0].myself = argument0
    with (global.monsterinstance[argument0])
        event_user(12)
    with (global.monsterinstance[argument0])
        event_user(15)
    return;
}

function scr_monster_statreset(monst_id) {
    global.monster[argument0] = false
    global.monsterx[argument0] = 0
    global.monstery[argument0] = 0
    global.monstername[argument0] = stringsetloc(" ", "scr_monster_statreset_slash_scr_monster_statreset_gml_5_0")
    global.monsterat[argument0] = 0
    global.monsterdf[argument0] = 0
    global.monsterhp[argument0] = 0
    global.monstermaxhp[argument0] = 0
    global.monsterinstance[argument0] = 12913921839
    global.monstergold[argument0] = 0
    global.monsterexp[argument0] = 0
    global.sparepoint[argument0] = 0
    global.hittarget[argument0] = 0
    global.mercymod[argument0] = 0
    global.mercymax[argument0] = 0
    global.monstercomment[argument0] = " "
    global.monsterattackname[argument0] = " "
    global.monsterstatus[argument0] = false
    scr_monster_actreset(argument0)
    return;
}

