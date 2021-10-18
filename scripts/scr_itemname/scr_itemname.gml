function scr_itemname() {
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        scr_itemnamelist()
    }
    return;
}

function scr_itemnamelist() {
    switch itemid
    {
        case 0:
            global.itemname[i] = stringsetloc(" ", "scr_itemnamelist_slash_scr_itemnamelist_gml_5_0")
            break
        case 1:
            global.itemname[i] = stringsetloc("Dark Candy", "scr_itemnamelist_slash_scr_itemnamelist_gml_8_0")
            break
        case 2:
            global.itemname[i] = stringsetloc("ReviveMint", "scr_itemnamelist_slash_scr_itemnamelist_gml_11_0")
            break
        case 3:
            global.itemname[i] = stringsetloc("Glowshard", "scr_itemnamelist_slash_scr_itemnamelist_gml_14_0")
            break
        case 4:
            global.itemname[i] = stringsetloc("Manual", "scr_itemnamelist_slash_scr_itemnamelist_gml_17_0")
            break
        case 5:
            global.itemname[i] = stringsetloc("BrokenCake", "scr_itemnamelist_slash_scr_itemnamelist_gml_20_0")
            break
        case 6:
            global.itemname[i] = stringsetloc("Top Cake", "scr_itemnamelist_slash_scr_itemnamelist_gml_23_0")
            break
        case 7:
            global.itemname[i] = stringsetloc("SpinCake", "scr_itemnamelist_slash_scr_itemnamelist_gml_26_0")
            break
        case 8:
            global.itemname[i] = stringsetloc("Darkburger", "scr_itemnamelist_slash_scr_itemnamelist_gml_29_0")
            break
        case 9:
            global.itemname[i] = stringsetloc("LancerCookie", "scr_itemnamelist_slash_scr_itemnamelist_gml_32_0")
            break
        case 10:
            global.itemname[i] = stringsetloc("GigaSalad", "scr_itemnamelist_slash_scr_itemnamelist_gml_35_0")
            break
        case 11:
            global.itemname[i] = stringsetloc("Clubswich", "scr_itemnamelist_slash_scr_itemnamelist_gml_38_0")
            break
        case 12:
            global.itemname[i] = stringsetloc("HeartsDonut", "scr_itemnamelist_slash_scr_itemnamelist_gml_41_0")
            break
        case 13:
            global.itemname[i] = stringsetloc("ChocDiamond", "scr_itemnamelist_slash_scr_itemnamelist_gml_44_0")
            break
        case 14:
            global.itemname[i] = stringsetloc("FavSandwich", "scr_itemnamelist_slash_scr_itemnamelist_gml_47_0")
            break
        case 15:
            global.itemname[i] = stringsetloc("RouxlsRoux", "scr_itemnamelist_slash_scr_itemnamelist_gml_50_0")
            break
        case 16:
            global.itemname[i] = stringsetloc("CD Bagel", "scr_itemnamelist_slash_scr_itemnamelist_gml_53_0")
            break
        case 17:
            global.itemname[i] = stringsetloc("Mannequin", "scr_itemnamelist_slash_scr_itemnamelist_gml_56_0")
            break
        case 18:
            global.itemname[i] = stringsetloc("Kris Tea", "scr_itemnamelist_slash_scr_itemnamelist_gml_59_0")
            break
        case 19:
            global.itemname[i] = stringsetloc("Noelle Tea", "scr_itemnamelist_slash_scr_itemnamelist_gml_62_0")
            break
        case 20:
            global.itemname[i] = stringsetloc("Ralsei Tea", "scr_itemnamelist_slash_scr_itemnamelist_gml_65_0")
            break
        case 21:
            global.itemname[i] = stringsetloc("Susie Tea", "scr_itemnamelist_slash_scr_itemnamelist_gml_68_0")
            break
        case 22:
            global.itemname[i] = stringsetloc("DD-Burger", "scr_itemnamelist_slash_scr_itemnamelist_gml_71_0")
            break
        case 23:
            global.itemname[i] = stringsetloc("LightCandy", "scr_itemnamelist_slash_scr_itemnamelist_gml_74_0")
            break
        case 24:
            global.itemname[i] = stringsetloc("ButJuice", "scr_itemnamelist_slash_scr_itemnamelist_gml_77_0")
            break
        case 25:
            global.itemname[i] = stringsetloc("SpagettiCode", "scr_itemnamelist_slash_scr_itemnamelist_gml_80_0")
            break
        case 26:
            global.itemname[i] = stringsetloc("JavaCookie", "scr_itemnamelist_slash_scr_itemnamelist_gml_83_0")
            break
        case 27:
            global.itemname[i] = stringsetloc("TensionBit", "scr_itemnamelist_slash_scr_itemnamelist_gml_86_0")
            break
        case 28:
            global.itemname[i] = stringsetloc("TensionGem", "scr_itemnamelist_slash_scr_itemnamelist_gml_89_0")
            break
        case 29:
            global.itemname[i] = stringsetloc("TensionMax", "scr_itemnamelist_slash_scr_itemnamelist_gml_92_0")
            break
        case 30:
            global.itemname[i] = stringsetloc("ReviveDust", "scr_itemnamelist_slash_scr_itemnamelist_gml_95_0")
            break
        case 31:
            global.itemname[i] = stringsetloc("ReviveBrite", "scr_itemnamelist_slash_scr_itemnamelist_gml_98_0")
            break
        case 32:
            global.itemname[i] = stringsetloc("S.POISON", "scr_itemnamelist_slash_scr_itemnamelist_gml_101_0")
            break
        case 33:
            global.itemname[i] = stringsetloc("DogDollar", "scr_itemnamelist_slash_scr_itemnamelist_gml_104_0")
            break
    }

    return;
}





function scr_litemname() {
    global.litemname[0] = " "
    for (i = 0; i < 8; i += 1)
    {
        itemid = global.litem[i]
        if (itemid == 0)
            global.litemname[i] = " "
        if (itemid == 1)
            global.litemname[i] = stringsetloc("Hot Chocolate", "scr_litemname_slash_scr_litemname_gml_6_0")
        if (itemid == 2)
            global.litemname[i] = stringsetloc("Pencil", "scr_litemname_slash_scr_litemname_gml_7_0")
        if (itemid == 3)
            global.litemname[i] = stringsetloc("Bandage", "scr_litemname_slash_scr_litemname_gml_8_0")
        if (itemid == 4)
            global.litemname[i] = stringsetloc("Bouquet", "scr_litemname_slash_scr_litemname_gml_9_0")
        if (itemid == 5)
            global.litemname[i] = stringsetloc("Ball of Junk", "scr_litemname_slash_scr_litemname_gml_10_0")
        if (itemid == 6)
            global.litemname[i] = stringsetloc("Halloween Pencil", "scr_litemname_slash_scr_litemname_gml_11_0")
        if (itemid == 7)
            global.litemname[i] = stringsetloc("Lucky Pencil", "scr_litemname_slash_scr_litemname_gml_12_0")
        if (itemid == 8)
            global.litemname[i] = stringsetloc("Egg", "scr_litemname_slash_scr_litemname_gml_13_0")
        if (itemid == 9)
            global.litemname[i] = stringsetloc("Cards", "scr_litemname_slash_scr_litemname_gml_14_0")
        if (itemid == 10)
            global.litemname[i] = stringsetloc("Box of Heart Candy", "scr_litemname_slash_scr_litemname_gml_15_0")
        if (itemid == 11)
            global.litemname[i] = stringsetloc("Glass", "scr_litemname_slash_scr_litemname_gml_16_0")
        if (itemid == 12)
            global.litemname[i] = stringsetloc("Eraser", "scr_litemname_slash_scr_litemname_gml_17_0")
        if (itemid == 13)
            global.litemname[i] = stringsetloc("Mech. Pencil", "scr_litemname_slash_scr_litemname_gml_18_0")
        if (itemid == 14)
            global.litemname[i] = stringsetloc("Wristwatch", "scr_litemname_slash_scr_litemname_gml_19_0")
    }
    return;
}
