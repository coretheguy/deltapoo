function scr_save() {
    scr_saveprocess(global.filechoice)
    filechoicebk2 = global.filechoice
    global.filechoice = 9
    scr_saveprocess(9)
    global.filechoice = filechoicebk2
    iniwrite = ossafe_ini_open("dr.ini")
    ini_write_string(scr_ini_chapter(global.chapter, global.filechoice), "Name", global.truename)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Level", global.lv)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Love", global.llv)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Time", global.time)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Date", date_current_datetime())
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Room", room)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "InitLang", global.flag[912])
    var uraboss = 0
    if (global.chapter == 1)
    {
        if (global.flag[241] == 6)
            uraboss = 1
        else if (global.flag[241] == 7)
            uraboss = 2
    }
    if (global.chapter == 2)
    {
        if (global.flag[571] == 1)
            uraboss = 1
        else if (global.flag[571] == 2)
            uraboss = 2
    }
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "UraBoss", uraboss)
    ossafe_ini_close()
    ossafe_savedata_save()
    return;
}



function scr_saveprocess(file) {
    global.lastsavedtime = global.time
    global.lastsavedlv = global.lv
    file = ("filech2_" + string(argument0))
    myfileid = ossafe_file_text_open_write(file)
    ossafe_file_text_write_string(myfileid, global.truename)
    ossafe_file_text_writeln(myfileid)
    if global.is_console
    {
        scr_ds_list_write(global.othername, 6)
        ossafe_file_text_writeln(myfileid)
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            ossafe_file_text_write_string(myfileid, global.othername[i])
            ossafe_file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real(myfileid, global.char[0])
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.char[1])
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.char[2])
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.gold)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.xp)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lv)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.inv)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.invc)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.darkzone)
    ossafe_file_text_writeln(myfileid)
    if global.is_console
    {
        var stats_amount = 0x000005
        scr_ds_list_write(global.hp, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.maxhp, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.at, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.df, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.mag, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.guts, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.charweapon, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.chararmor1, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.chararmor2, stats_amount)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.weaponstyle, stats_amount)
        ossafe_file_text_writeln(myfileid)
    }
    for (i = 0; i < 5; i += 1)
    {
        if (!global.is_console)
        {
            ossafe_file_text_write_real(myfileid, global.hp[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.maxhp[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.at[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.df[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.mag[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.guts[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.charweapon[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.chararmor1[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.chararmor2[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.weaponstyle[i])
            ossafe_file_text_writeln(myfileid)
        }
        for (q = 0; q < 4; q += 1)
        {
            ossafe_file_text_write_real(myfileid, global.itemat[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemdf[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemmag[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itembolts[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemgrazeamt[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemgrazesize[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemboltspeed[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemspecial[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemelement[i][q])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.itemelementamount[i][q])
            ossafe_file_text_writeln(myfileid)
        }
        for (j = 0; j < 12; j += 1)
        {
            ossafe_file_text_write_real(myfileid, global.spell[i][j])
            ossafe_file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real(myfileid, global.boltspeed)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.grazeamt)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.grazesize)
    ossafe_file_text_writeln(myfileid)
    if global.is_console
    {
        scr_ds_list_write(global.item, 13)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.keyitem, 13)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.weapon, 48)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.armor, 48)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.pocketitem, 72)
        ossafe_file_text_writeln(myfileid)
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            ossafe_file_text_write_real(myfileid, global.item[j])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.keyitem[j])
            ossafe_file_text_writeln(myfileid)
        }
        for (j = 0; j < 48; j++)
        {
            ossafe_file_text_write_real(myfileid, global.weapon[j])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.armor[j])
            ossafe_file_text_writeln(myfileid)
        }
        for (j = 0; j < 72; j++)
        {
            ossafe_file_text_write_real(myfileid, global.pocketitem[j])
            ossafe_file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real(myfileid, global.tension)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.maxtension)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lweapon)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.larmor)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lxp)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.llv)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lgold)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lhp)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lmaxhp)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lat)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.ldf)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.lwstrength)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.ladef)
    ossafe_file_text_writeln(myfileid)
    if global.is_console
    {
        scr_ds_list_write(global.litem, 8)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.phone, 8)
        ossafe_file_text_writeln(myfileid)
        scr_ds_list_write(global.flag, 2500)
        ossafe_file_text_writeln(myfileid)
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            ossafe_file_text_write_real(myfileid, global.litem[i])
            ossafe_file_text_writeln(myfileid)
            ossafe_file_text_write_real(myfileid, global.phone[i])
            ossafe_file_text_writeln(myfileid)
        }
        for (i = 0; i < 2500; i += 1)
        {
            ossafe_file_text_write_real(myfileid, global.flag[i])
            ossafe_file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real(myfileid, global.plot)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.currentroom)
    ossafe_file_text_writeln(myfileid)
    ossafe_file_text_write_real(myfileid, global.time)
    ossafe_file_text_close(myfileid)
    return;
}



function scr_load() {
    snd_free_all()
    filechoicebk = global.filechoice
    scr_gamestart()
    global.filechoice = filechoicebk
    file = ("filech2_" + string(global.filechoice))
    myfileid = ossafe_file_text_open_read(file)
    global.truename = ossafe_file_text_read_string(myfileid)
    ossafe_file_text_readln(myfileid)
    if global.is_console
    {
        var othername_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(othername_list); i += 1)
            global.othername[i] = ds_list_find_value(othername_list, i)
        ds_list_destroy(othername_list)
        ossafe_file_text_readln(myfileid)
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            global.othername[i] = ossafe_file_text_read_string(myfileid)
            ossafe_file_text_readln(myfileid)
        }
    }
    global.char[0] = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.char[1] = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.char[2] = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.gold = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.xp = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lv = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.inv = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.invc = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.darkzone = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    if global.is_console
    {
        var hp_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(hp_list); i += 1)
            global.hp[i] = ds_list_find_value(hp_list, i)
        ds_list_destroy(hp_list)
        ossafe_file_text_readln(myfileid)
        var maxhp_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(maxhp_list); i += 1)
            global.maxhp[i] = ds_list_find_value(maxhp_list, i)
        ds_list_destroy(maxhp_list)
        ossafe_file_text_readln(myfileid)
        var at_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(at_list); i += 1)
            global.at[i] = ds_list_find_value(at_list, i)
        ds_list_destroy(at_list)
        ossafe_file_text_readln(myfileid)
        var df_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(df_list); i += 1)
            global.df[i] = ds_list_find_value(df_list, i)
        ds_list_destroy(df_list)
        ossafe_file_text_readln(myfileid)
        var mag_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(mag_list); i += 1)
            global.mag[i] = ds_list_find_value(mag_list, i)
        ds_list_destroy(mag_list)
        ossafe_file_text_readln(myfileid)
        var guts_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(guts_list); i += 1)
            global.guts[i] = ds_list_find_value(guts_list, i)
        ds_list_destroy(guts_list)
        ossafe_file_text_readln(myfileid)
        var charweapon_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(charweapon_list); i += 1)
            global.charweapon[i] = ds_list_find_value(charweapon_list, i)
        ds_list_destroy(charweapon_list)
        ossafe_file_text_readln(myfileid)
        var chararmor1_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(chararmor1_list); i += 1)
            global.chararmor1[i] = ds_list_find_value(chararmor1_list, i)
        ds_list_destroy(chararmor1_list)
        ossafe_file_text_readln(myfileid)
        var chararmor2_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(chararmor2_list); i += 1)
            global.chararmor2[i] = ds_list_find_value(chararmor2_list, i)
        ds_list_destroy(chararmor2_list)
        ossafe_file_text_readln(myfileid)
        var weaponstyle_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(weaponstyle_list); i += 1)
            global.weaponstyle[i] = ds_list_find_value(weaponstyle_list, i)
        ds_list_destroy(weaponstyle_list)
        ossafe_file_text_readln(myfileid)
    }
    for (i = 0; i < 5; i += 1)
    {
        if (!global.is_console)
        {
            global.hp[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.maxhp[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.at[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.df[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.mag[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.guts[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.charweapon[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.chararmor1[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.chararmor2[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.weaponstyle[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
        for (q = 0; q < 4; q += 1)
        {
            global.itemat[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemdf[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemmag[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itembolts[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemgrazeamt[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemgrazesize[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemboltspeed[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemspecial[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemelement[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.itemelementamount[i][q] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
        for (j = 0; j < 12; j += 1)
        {
            global.spell[i][j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
    }
    global.boltspeed = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.grazeamt = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.grazesize = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    if global.is_console
    {
        var item_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(item_list); i += 1)
            global.item[i] = ds_list_find_value(item_list, i)
        ds_list_destroy(item_list)
        ossafe_file_text_readln(myfileid)
        var keyitem_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(keyitem_list); i += 1)
            global.keyitem[i] = ds_list_find_value(keyitem_list, i)
        ds_list_destroy(keyitem_list)
        ossafe_file_text_readln(myfileid)
        var weapon_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(weapon_list); i += 1)
            global.weapon[i] = ds_list_find_value(weapon_list, i)
        ds_list_destroy(weapon_list)
        ossafe_file_text_readln(myfileid)
        var armor_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(armor_list); i += 1)
            global.armor[i] = ds_list_find_value(armor_list, i)
        ds_list_destroy(armor_list)
        ossafe_file_text_readln(myfileid)
        var pocket_list = scr_ds_list_read(myfileid)
        for (i = 0; i < ds_list_size(pocket_list); i += 1)
            global.pocketitem[i] = ds_list_find_value(pocket_list, i)
        ds_list_destroy(pocket_list)
        ossafe_file_text_readln(myfileid)
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            global.item[j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.keyitem[j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
        for (j = 0; j < 48; j += 1)
        {
            global.weapon[j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.armor[j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
        for (j = 0; j < 72; j += 1)
        {
            global.pocketitem[j] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
    }
    global.tension = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.maxtension = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lweapon = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.larmor = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lxp = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.llv = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lgold = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lhp = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lmaxhp = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lat = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.ldf = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.lwstrength = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.ladef = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    if global.is_console
    {
        var litem_list = scr_ds_list_read(myfileid)
        for (i = 0; i < (ds_list_size(litem_list) - 1); i += 1)
            global.litem[i] = ds_list_find_value(litem_list, i)
        ds_list_destroy(litem_list)
        ossafe_file_text_readln(myfileid)
        var phone_list = scr_ds_list_read(myfileid)
        for (i = 0; i < (ds_list_size(phone_list) - 1); i += 1)
            global.phone[i] = ds_list_find_value(phone_list, i)
        ds_list_destroy(phone_list)
        ossafe_file_text_readln(myfileid)
        var flag_list = scr_ds_list_read(myfileid)
        for (i = 0; i < (ds_list_size(flag_list) - 1); i += 1)
            global.flag[i] = ds_list_find_value(flag_list, i)
        ds_list_destroy(flag_list)
        ossafe_file_text_readln(myfileid)
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            global.litem[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
            global.phone[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
        for (i = 0; i < 2500; i += 1)
        {
            global.flag[i] = ossafe_file_text_read_real(myfileid)
            ossafe_file_text_readln(myfileid)
        }
    }
    global.plot = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.currentroom = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    global.time = ossafe_file_text_read_real(myfileid)
    ossafe_file_text_readln(myfileid)
    ossafe_file_text_close(myfileid)
    global.lastsavedtime = global.time
    global.lastsavedlv = global.lv
    scr_tempsave()
    audio_group_set_gain(1, global.flag[15], 0)
    audio_set_master_gain(0, global.flag[17])
    __loadedroom = global.currentroom
    debug_message(string(__loadedroom))
    //debug_message(string(PLACE_DOG))
    //if scr_dogcheck()
    //    __loadedroom = choose(PLACE_DOG, PLACE_DOGCHECK2)
    room_goto(__loadedroom)
    return;
}
