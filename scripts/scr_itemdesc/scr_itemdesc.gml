function scr_itemdesc() {
    for (i = 0; i < 12; i += 1)
    {
        itemid = global.item[i]
        itemdesc[i] = scr_itemdesc_single(itemid)
    }
    return;
}

function scr_itemdesc_single(item) {
    __itemdesc = stringsetloc("---", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_1_0")
    switch argument0
    {
        case 0:
            __itemdesc = stringsetloc("---", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_5_0")
            break
        case 1:
            __itemdesc = stringsetloc("Heals 40 HP. A red-and-black star#that tastes like marshmallows.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_8_0")
            break
        case 2:
            __itemdesc = stringsetloc("Heals a fallen ally to MAX HP.#A minty green crystal.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_11_0")
            break
        case 3:
            __itemdesc = stringsetloc("A shimmering shard.#Its use is unknown.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_14_0")
            if (global.chapter >= 2)
                __itemdesc = stringsetloc("A shimmering shard.#Its value increases each Chapter.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_17_0_b")
            break
        case 4:
            __itemdesc = stringsetloc("Ralsei's handmade book full of#various tips and tricks.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_17_0")
            break
        case 5:
            __itemdesc = stringsetloc("Though broken, it seethes with power.#A master smith could fix it.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_20_0")
            break
        case 6:
            __itemdesc = stringsetloc("This cake will make your taste buds#spin! Heals 160 HP to the team.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_23_0")
            break
        case 7:
            var healamount = (global.chapter == 1 ? 80 : 140)
            __itemdesc = stringsetsubloc("A pastry in the shape of a top.#Heals ~1 HP to the team.", string(healamount), "scr_itemdesc_single_slash_scr_itemdesc_single_gml_27_0")
            break
        case 8:
            __itemdesc = stringsetloc("A mysterious black burger made of...#Hey, this is just burnt! +70HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_30_0")
            break
        case 9:
            __itemdesc = stringsetloc("A cookie shaped like Lancer's face.#Maybe not a cookie. Heals 1 HP?", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_33_0")
            break
        case 10:
            __itemdesc = stringsetloc("An enormous salad... but, it's just#lettuce, so it's worthless. +4HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_36_0")
            break
        case 11:
            __itemdesc = stringsetloc("A sandwich that can be split into 3.#Heals 70 HP to the team.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_39_0")
            break
        case 12:
            __itemdesc = stringsetloc("Hearts, don't it!? It's filled with#divisive, clotty red jam. +??HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_42_0")
            break
        case 13:
            __itemdesc = stringsetloc("It's quite small, but some#people REALLY like it. +??HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_45_0")
            break
        case 14:
            __itemdesc = stringsetloc("You'd think it tastes perfect.#Heals 500HP.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_48_0")
            break
        case 15:
            __itemdesc = stringsetloc("A dark roux with a delicate aroma.#Also... has worms in it. +50HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_51_0")
            break
        case 16:
            __itemdesc = stringsetloc("A bagel with a reflective inside.#Makes music with each bite. +80HP", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_54_0")
            break
        case 17:
            __itemdesc = stringsetloc("It's a mannequin with the clothes#permanently attached. Useless", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_57_0")
            break
        case 18:
            __itemdesc = stringsetloc("It's own-flavored tea.#The flavor just says \"Kris.\"", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_60_0")
            break
        case 19:
            __itemdesc = stringsetloc("It's own-flavored tea.#The flavor just says \"Noelle.\"", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_63_0")
            break
        case 20:
            __itemdesc = stringsetloc("It's own-flavored tea.#The flavor just says \"Ralsei.\"", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_66_0")
            break
        case 21:
            __itemdesc = stringsetloc("It's own-flavored tea.#The flavor just says \"Susie.\"", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_69_0")
            break
        case 22:
            __itemdesc = stringsetloc("It's the Double-Dark-Burger.#It'll take two bites to finish!", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_72_0")
            break
        case 23:
            __itemdesc = stringsetloc("White candy with a chalky texture.#It'll recover 120HP.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_75_0")
            break
        case 24:
            __itemdesc = stringsetloc("It's short for ButlerJuice.#It changes color with temperature.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_78_0")
            break
        case 25:
            __itemdesc = stringsetloc("Spaghetti woven by master coders, made#of macarons and ribbons. +30HP to all.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_81_0")
            break
        case 26:
            __itemdesc = stringsetloc("A coffee-and-chocolate flavored cookie.#Words spark out when you bite it.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_84_0")
            break
        case 27:
            __itemdesc = stringsetloc("Raises TP by 32% in battle.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_87_0")
            break
        case 28:
            __itemdesc = stringsetloc("Raises TP by 50% in battle.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_90_0")
            break
        case 29:
            __itemdesc = stringsetloc("Raises TP to full in battle.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_93_0")
            break
        case 30:
            __itemdesc = stringsetloc("A minty powder that revives all#fallen party members to 25% HP.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_96_0")
            break
        case 31:
            __itemdesc = stringsetloc("A breakable mint that revives all#fallen party members to 100% HP.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_99_0")
            break
        case 32:
            __itemdesc = stringsetloc("A strange concoction made of#colorful squares. Will poison you.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_102_0")
            break
        case 33:
            __itemdesc = stringsetloc("A dollar with a certain dog on it.#Its value decreases each Chapter.", "scr_itemdesc_single_slash_scr_itemdesc_single_gml_109_0")
            break
    }

    return __itemdesc;
}

function scr_litemdesc(litem) {
    global.msg[0] = stringsetloc("* Your eyesight became blurry./%", "scr_litemdesc_slash_scr_litemdesc_gml_1_0")
    switch argument0
    {
        case 0:
            global.msg[0] = stringsetloc("* Your heartbeat quickened./%", "scr_litemdesc_slash_scr_litemdesc_gml_5_0")
            break
        case 1:
            global.msg[0] = stringsetloc("* \"Hot Chocolate\" - Topped with home-made marshmallows in the shape of bunnies./%", "scr_litemdesc_slash_scr_litemdesc_gml_8_0")
            break
        case 2:
            global.msg[0] = stringsetloc("* \"Pencil\" - Weapon 1 AT&* Mightier than a sword?&* Maybe equal at best./%", "scr_litemdesc_slash_scr_litemdesc_gml_11_0")
            break
        case 3:
            global.msg[0] = stringsetloc("* \"Bandage\" - Heals 10 HP&* It has cartoon characters on it./%", "scr_litemdesc_slash_scr_litemdesc_gml_14_0")
            break
        case 4:
            global.msg[0] = stringsetloc("* \"Bouquet\" - A bouquet of beautiful flowers in many colors./", "scr_litemdesc_slash_scr_litemdesc_gml_17_0")
            global.msg[1] = stringsetloc("* Perhaps it could be offered to someone./%", "scr_litemdesc_slash_scr_litemdesc_gml_18_0")
            break
        case 5:
            global.msg[0] = stringsetloc("* \"Ball of Junk\" - A small ball of accumulated things in your pocket./%", "scr_litemdesc_slash_scr_litemdesc_gml_21_0")
            if scr_itemcheck(1)
            {
                global.msg[0] = stringsetloc("* \"Ball of Junk\" - A small ball of accumulated things in your pocket./", "scr_litemdesc_slash_scr_litemdesc_gml_25_0")
                global.msg[1] = stringsetloc("* It smells like scratch'n'sniff marshmallow stickers./%", "scr_litemdesc_slash_scr_litemdesc_gml_26_0")
            }
            break
        case 6:
            global.msg[0] = stringsetloc("* \"Halloween Pencil\" - Weapon 1 AT&* Orange with black bats on it./%", "scr_litemdesc_slash_scr_litemdesc_gml_30_0")
            break
        case 7:
            global.msg[0] = stringsetloc("* \"Lucky Pencil\" - Weapon 1 AT&* Covered in green clovers and rainbows./%", "scr_litemdesc_slash_scr_litemdesc_gml_33_0")
            break
        case 8:
            global.msg[0] = stringsetloc("* \"Egg\" - Not too important^1, not too unimportant./%", "scr_litemdesc_slash_scr_litemdesc_gml_36_0")
            break
        case 9:
            global.msg[0] = stringsetloc("* \"Cards\" - The Jack of Spades^1, and the Rules Card./%", "scr_litemdesc_slash_scr_litemdesc_gml_39_0")
            break
        case 10:
            global.msg[0] = stringsetloc("* \"Box of Heart Candy\" - It's not yours^1. Will that stop you?/%", "scr_litemdesc_slash_scr_litemdesc_gml_42_0")
            break
        case 11:
            global.msg[0] = stringsetloc("* There is a small shard of something in your pocket./", "scr_litemdesc_slash_scr_litemdesc_gml_45_0")
            global.msg[1] = stringsetloc("* It feels like glass, but.../%", "scr_litemdesc_slash_scr_litemdesc_gml_46_0")
            break
        case 12:
            global.msg[0] = stringsetloc("* \"Eraser\" - Weapon 1 AT&* Pink^1, it bounces when thrown on the ground./%", "scr_litemdesc_slash_scr_litemdesc_gml_49_0")
            break
        case 13:
            global.msg[0] = stringsetloc("* \"Mechanical Pencil\" - 1 AT&* It's tempting to click it repeatedly./%", "scr_litemdesc_slash_scr_litemdesc_gml_52_0")
            break
        case 14:
            global.msg[0] = stringsetloc("* \"Wristwatch\" - Armor 1 DF&* Maybe an expensive antique.&* Stuck before half past noon./%", "scr_litemdesc_slash_scr_litemdesc_gml_55_0")
            break
    }

    return;
}

