function scr_randomtarget() {
    abletotarget = 1
    if (global.charcantarget[0] == 0 && global.charcantarget[1] == 0 && global.charcantarget[2] == 0)
        abletotarget = 0
    mytarget = choose(0, 1, 2)
    if (abletotarget == 1)
    {
        while (global.charcantarget[mytarget] == 0)
            mytarget = choose(0, 1, 2)
    }
    else
        mytarget = 3
    global.targeted[mytarget] = 1
    if (global.chapter >= 2 && mytarget != 3)
    {
        if global.charcantarget[0]
            global.targeted[0] = 1
        if global.charcantarget[1]
            global.targeted[1] = 1
        if global.charcantarget[2]
            global.targeted[2] = 1
        mytarget = 4
    }
    return;
}

function scr_prioritytarget(argument0, argument1, argument2) {
    abletotarget = 1
    if (global.charcantarget[0] == 0 && global.charcantarget[1] == 0 && global.charcantarget[2] == 0)
        abletotarget = 0
    mytarget = scr_weightedrandom(argument0, argument1, argument2)
    if (abletotarget == 1)
    {
        while (global.charcantarget[mytarget] == 0)
            mytarget = scr_weightedrandom(argument0, argument1, argument2)
    }
    else
        mytarget = 3
    global.targeted[mytarget] = 1
    if (global.chapter >= 2 && mytarget != 3)
    {
        if global.charcantarget[0]
            global.targeted[0] = 1
        if global.charcantarget[1]
            global.targeted[1] = 1
        if global.charcantarget[2]
            global.targeted[2] = 1
        mytarget = 4
    }
    return;
}

function scr_targetall() {
    for (_ti = 0; _ti < 3; _ti += 1)
    {
        if (global.charcantarget[_ti] == 1)
            global.targeted[_ti] = 1
    }
    mytarget = 3
    target = 3
    return;
}




function scr_damage_calculation(argument0, argument1) {
    var _tdamage = argument0
    var _tdef = global.battledf[argument1]
    var _tmaxhp = global.maxhp[global.char[argument1]]
    var _finaldamage = 1
    var _hpthresholda = (_tmaxhp / 5)
    var _hpthresholdb = (_tmaxhp / 8)
    for (var _di = 0; _di < _tdef; _di++)
    {
        if (_tdamage > _hpthresholda)
            _tdamage -= 3
        else if (_tdamage > _hpthresholdb)
            _tdamage -= 2
        else
            _tdamage -= 1
    }
    return max(_tdamage, _finaldamage);
}

function scr_element_damage_reduction(argument0, argument1) {
    var ___element = argument0
    var ___char = argument1
    var ___reduction = 1
    if (___element != 0)
    {
        for (var ___itemi = 0; ___itemi < 2; ___itemi++)
        {
            if (global.itemelement[___char][(___itemi + 1)] != 0)
            {
                if (global.itemelement[___char][(___itemi + 1)] == ___element)
                    ___reduction -= global.itemelementamount[___char][(___itemi + 1)]
                if (global.itemelement[___char][(___itemi + 1)] == 9)
                {
                    if (___element == 2 || ___element == 8)
                        ___reduction -= global.itemelementamount[___char][(___itemi + 1)]
                }
                if (global.itemelement[___char][(___itemi + 1)] == 10)
                    ___reduction -= global.itemelementamount[___char][(___itemi + 1)]
            }
        }
    }
    if (___reduction < 0.25)
        ___reduction = 0.25
    return ___reduction;
}

