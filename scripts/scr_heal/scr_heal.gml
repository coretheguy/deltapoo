function scr_heal(char, hp) {
    abovemaxhp = false
    belowzero = false
    hltarget = global.char[argument0]
    _curhp = global.hp[hltarget]
    if (global.hp[hltarget] <= 0)
        belowzero = true
    if (global.hp[hltarget] > global.maxhp[hltarget])
        abovemaxhp = true
    if (abovemaxhp == false)
    {
        global.hp[hltarget] += argument1
        if (global.hp[hltarget] > global.maxhp[hltarget])
            global.hp[hltarget] = global.maxhp[hltarget]
    }
    if (belowzero == true && global.hp[hltarget] >= 0)
    {
        if (global.hp[hltarget] < ceil((global.maxhp[hltarget] / 6)))
            global.hp[hltarget] = ceil((global.maxhp[hltarget] / 6))
        scr_revive(argument0)
    }
    snd_stop(snd_power)
    snd_play(snd_power)
    return (global.hp[hltarget] - _curhp);
}

function scr_healall(hp) {
    for (i = 0; i < 3; i += 1)
    {
        if (global.char[i] != 0)
            scr_heal(i, argument0)
    }
    return;
}

function scr_healitemspell(hp) {
    scr_heal(star, argument0)
    global.spelldelay = 15
    with (global.charinstance[star])
    {
        ha = instance_create(x, y, obj_healanim)
        ha.target = id
        if (global.chapter == 2 && instance_exists(o_boxingcontroller))
            ha.target = o_boxingcontroller.id
        dmgwr = scr_dmgwriter_selfchar()
        with (dmgwr)
        {
            delay = 8
            type = 3
            damage = argument0
        }
        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
        {
            with (dmgwr)
                specialmessage = 3
        }
        tu += 1
        var temp = ha
        return temp;
    }
}

