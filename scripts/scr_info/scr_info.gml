function scr_iteminfo_all() {
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        scr_iteminfo(itemid)
        global.itemnameb[i] = itemnameb
        global.itemdescb[i] = itemdescb
        global.itemvalue[i] = value
        global.itemusable[i] = usable
    }
    return;
}

function scr_keyiteminfo_all() {
    for (i = 0; i < 12; i += 1)
    {
        keyitemid = global.keyitem[i]
        keyitemname[i] = " "
        scr_keyiteminfo(keyitemid)
        keyitemusable[i] = tempkeyitemusable
        keyitemname[i] = tempkeyitemname
        keyitemdesc[i] = tempkeyitemdesc
    }
    return;
}



function scr_spellinfo_all() {
    for (j = 0; j < 6; j += 1)
    {
        for (i = 0; i < 12; i += 1)
        {
            spellid = global.spell[j][i]
            scr_spellinfo(spellid)
            global.spellname[j][i] = spellname
            global.spellnameb[j][i] = spellnameb
            global.spelldescb[j][i] = spelldescb
            global.spelldesc[j][i] = spelldesc
            global.spellcost[j][i] = cost
            global.spellusable[j][i] = spellusable
            global.spelltarget[j][i] = spelltarget
        }
    }
    return;
}



function scr_armorinfo_all() {
    for (i = 0; i < 48; i += 1)
    {
        scr_armorinfo(global.armor[i])
        armorname[i] = armornametemp
        armordesc[i] = armordesctemp
        amessage2[i] = amessage2temp
        amessage3[i] = amessage3temp
        amessage4[i] = amessage4temp
        armorat[i] = armorattemp
        armordf[i] = armordftemp
        armormag[i] = armormagtemp
        armorbolts[i] = armorboltstemp
        armorgrazeamt[i] = armorgrazeamttemp
        armorgrazesize[i] = armorgrazesizetemp
        armorchar1[i] = armorchar1temp
        armorchar2[i] = armorchar2temp
        armorchar3[i] = armorchar3temp
        armorchar4[i] = armorchar4temp
        armorvalue[i] = value
        armorability[i] = armorabilitytemp
        armorabilityicon[i] = armorabilityicontemp
        armoricon[i] = armoricontemp
        armorelement[i] = armorelementtemp
        armorelementamount[i] = armorelementamounttemp
    }
    return;
}

function scr_weaponinfo_all() {
    for (i = 0; i < 48; i += 1)
    {
        scr_weaponinfo(global.weapon[i])
        weaponname[i] = weaponnametemp
        weapondesc[i] = weapondesctemp
        wmessage2[i] = wmessage2temp
        wmessage3[i] = wmessage3temp
        wmessage4[i] = wmessage4temp
        weaponat[i] = weaponattemp
        weapondf[i] = weapondftemp
        weaponmag[i] = weaponmagtemp
        weaponbolts[i] = weaponboltstemp
        weaponstyle[i] = weaponstyletemp
        weapongrazeamt[i] = weapongrazeamttemp
        weapongrazesize[i] = weapongrazesizetemp
        weaponchar1[i] = weaponchar1temp
        weaponchar2[i] = weaponchar2temp
        weaponchar3[i] = weaponchar3temp
        weaponchar4[i] = weaponchar4temp
        weaponvalue[i] = value
        weaponability[i] = weaponabilitytemp
        weaponabilityicon[i] = weaponabilityicontemp
        weaponicon[i] = weaponicontemp
    }
    return;
}




function scr_armorinfo_mine() {
    for (i = 0; i < 6; i += 1)
    {
        scr_armorinfo(global.chararmor1[i])
        chararmor1name[i] = armornametemp
        chararmor1desc[i] = armordesctemp
        chararmor1at[i] = armorattemp
        chararmor1df[i] = armordftemp
        chararmor1mag[i] = armormagtemp
        chararmor1bolts[i] = armorboltstemp
        chararmor1grazeamt[i] = armorgrazeamttemp
        chararmor1grazesize[i] = armorgrazesizetemp
        chararmor1ability[i] = armorabilitytemp
        chararmor1abilityicon[i] = armorabilityicontemp
        chararmor1icon[i] = armoricontemp
        chararmor1element[i] = armorelementtemp
        chararmor1elementamount[i] = armorelementamounttemp
        global.itemat[i][1] = armorattemp
        global.itemdf[i][1] = armordftemp
        global.itemmag[i][1] = armormagtemp
        global.itembolts[i][1] = armorboltstemp
        global.itemgrazeamt[i][1] = armorgrazeamttemp
        global.itemgrazesize[i][1] = armorgrazesizetemp
        global.itemelement[i][1] = armorelementtemp
        global.itemelementamount[i][1] = armorelementamounttemp
        scr_armorinfo(global.chararmor2[i])
        chararmor2name[i] = armornametemp
        chararmor2desc[i] = armordesctemp
        chararmor2at[i] = armorattemp
        chararmor2df[i] = armordftemp
        chararmor2mag[i] = armormagtemp
        chararmor2bolts[i] = armorboltstemp
        chararmor2grazeamt[i] = armorgrazeamttemp
        chararmor2grazesize[i] = armorgrazesizetemp
        chararmor2ability[i] = armorabilitytemp
        chararmor2abilityicon[i] = armorabilityicontemp
        chararmor2icon[i] = armoricontemp
        chararmor2element[i] = armorelementtemp
        chararmor2elementamount[i] = armorelementamounttemp
        global.itemat[i][2] = armorattemp
        global.itemdf[i][2] = armordftemp
        global.itemmag[i][2] = armormagtemp
        global.itembolts[i][2] = armorboltstemp
        global.itemgrazeamt[i][2] = armorgrazeamttemp
        global.itemgrazesize[i][2] = armorgrazesizetemp
        global.itemelement[i][2] = armorelementtemp
        global.itemelementamount[i][2] = armorelementamounttemp
    }
    return;
}


function scr_weaponinfo_mine() {
    for (i = 0; i < 6; i += 1)
    {
        scr_weaponinfo(global.charweapon[i])
        charweaponname[i] = weaponnametemp
        charweapondesc[i] = weapondesctemp
        charweaponat[i] = weaponattemp
        charweapondf[i] = weapondftemp
        charweaponmag[i] = weaponmagtemp
        charweaponbolts[i] = weaponboltstemp
        charweaponstyle[i] = weaponstyletemp
        charweapongrazeamt[i] = weapongrazeamttemp
        charweapongrazesize[i] = weapongrazesizetemp
        charweaponability[i] = weaponabilitytemp
        charweaponabilityicon[i] = weaponabilityicontemp
        charweaponicon[i] = weaponicontemp
        global.itemat[i][0] = weaponattemp
        global.itemdf[i][0] = weapondftemp
        global.itemmag[i][0] = weaponmagtemp
        global.itembolts[i][0] = weaponboltstemp
        global.itemgrazeamt[i][0] = weapongrazeamttemp
        global.itemgrazesize[i][0] = weapongrazesizetemp
    }
    return;
}

