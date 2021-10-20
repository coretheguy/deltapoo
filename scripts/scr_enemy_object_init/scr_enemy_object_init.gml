function scr_enemy_object_init() {
    becomeflash = false
    flash = false
    turnt = 0
    turns = 0
    talktimer = 0
    state = 0
    siner = 0
    fsiner = 0
    talked = false
    attacked = false
    hurt = false
    hurttimer = 0
    hurtshake = 0
    shakex = 0
    acting = false
    actcon = 0
    mywriter = 343249823
    acttimer = 0
    con = 0
    dodgetimer = 0
    fatal = false
    candodge = false
    mytarget = 0
    ambushed = false
    firststrike = 0
    damage = -1
    grazepoints = -1
    timepoints = -1
    inv = -1
    target = -1
    grazed = -1
    grazetimer = -1
    element = "none"
    acting = false
    actingsus = false
    actingnoe = false
    actingral = false
    actconsus = 0
    actconral = 0
    actconnoe = 0
    simulorderkri = -1
    simulordersus = -1
    simulorderral = -1
    simulordernoe = -1
    simultotal = 0
    simulboss = -1
    talkmax = 90
    mercymod = 0
    maxmercy = 100
    recruitable = true
    freezable = true
    recruitcount = 1
    sactionboxx = 0
    sactionboxy = 0
    hurtspriteoffx = 0
    hurtspriteoffy = 0
    image_xscale = 2
    image_yscale = 2
    image_speed = 0.2
    idlesprite = spr_diamondm_idle
    hurtsprite = spr_diamondm_hurt
    sparedsprite = spr_diamondm_spared
    custombody = 0
    for (i = 0; i < 10; i++)
        _charactsprite[i] = 382938298329
    depth = (90 - ((y - cameray()) / 50))
    return;
}

function scr_enemyhurt_tired_after_damage(hpthres) {
    if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * argument0))
        scr_monster_make_tired(myself)
    return;
}

function scr_monster_make_tired(monst_id) {
    global.monstercomment[argument0] = stringsetloc("(Tired)", "scr_monster_make_tired_slash_scr_monster_make_tired_gml_1_0")
    global.monsterstatus[argument0] = true
    return;
}

function scr_defeatrun() {
    if object_is_ancestor(object_index, obj_monsterparent)
    {
        var __frozen = false
        if (global.flag[(51 + myself)] == 6)
            __frozen = true
        if (__frozen == true)
        {
            _rtext = instance_create(global.monsterx[myself], (global.monstery[myself] - 40), obj_recruitanim)
            _rtext.image_index = 12
            if (recruitable == true)
                global.flag[(global.monstertype[myself] + 600)] = -1
            global.flag[63] = 1
        }
        if (recruitable == true && global.flag[61] == 0 && __frozen == false)
        {
            global.flag[63] = 1
            if (global.flag[(global.monstertype[myself] + 600)] != -1)
            {
                global.flag[(global.monstertype[myself] + 600)] = -1
                _rtext = instance_create(global.monsterx[myself], (global.monstery[myself] - 40), obj_recruitanim)
                _rtext.image_index = 7
            }
        }
    }
    else
        fatal = false
    if (!__frozen)
    {
        if (fatal == true)
            defeatanim = instance_create(x, y, obj_deathanim)
        else
            defeatanim = instance_create(x, y, obj_defeatanim)
    }
    else if __frozen
    {
        defeatanim = instance_create(x, y, obj_frozennpc)
        defeatanim.depth = depth
        defeatanim.inbattle = 1
    }
    defeatanim.sprite_index = sprite_index
    defeatanim.sprite_index = hurtsprite
    defeatanim.image_index = 0
    defeatanim.image_xscale = image_xscale
    defeatanim.image_yscale = image_yscale
    instance_destroy()
    return;
}

function scr_monsterdefeat() {
    if (global.monster[myself] == true)
    {
        global.monstergold[3] += global.monstergold[myself]
        global.monsterexp[3] += global.monsterexp[myself]
        global.monster[myself] = false
        if (global.flag[(51 + myself)] == 0)
        {
            global.flag[(51 + myself)] = 2
            if (global.monsterhp[myself] <= 0)
                global.flag[(51 + myself)] = 1
        }
        if (global.flag[(51 + myself)] == 1)
        {
            global.flag[40] += 1
            if (fatal == true)
                global.flag[44] = (global.flag[44] + 1)
        }
        if (global.flag[(51 + myself)] == 2)
            global.flag[41] += 1
        if (global.flag[(51 + myself)] == 3)
            global.flag[42] += 1
        if (global.flag[(51 + myself)] == 5)
            global.flag[43] += 1
        if (global.flag[(51 + myself)] == 6)
        {
            global.flag[45] += 1
            global.monstergold[3] += 24
        }
        if (scr_monsterpop() == 0)
        {
            _amt_add = 0
            _frozened = 0
            _violenced = 0
            _spared = 0
            _pacified = 0
            for (d_i = 0; d_i < 3; d_i += 1)
            {
                if (global.flag[(51 + d_i)] != 0)
                    _amt_add += 1
                if (global.flag[(51 + d_i)] == 1)
                    _violenced += 1
                if (global.flag[(51 + d_i)] == 2)
                    _spared += 1
                if (global.flag[(51 + d_i)] == 3)
                    _pacified += 1
                if (global.flag[(51 + d_i)] == 6)
                    _frozened += 1
            }
            if (_frozened > 0)
                global.flag[50] = 6
            if (_pacified > 0)
                global.flag[50] = 3
            if (_spared > 0)
                global.flag[50] = 2
            if (_violenced > 0)
                global.flag[50] = 1
            if (global.flag[50] == 6)
                global.flag[926] = (global.flag[926] + 1)
            if (global.flag[54] != 0)
            {
                global.flag[global.flag[54]] = global.flag[50]
                global.flag[54] = 0
            }
        }
        event_user(11)
    }
    return;
}
