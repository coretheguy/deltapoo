function scr_retarget(char) {
    thistarget = global.chartarget[argument0]
    cancelattack = false
    if (thistarget == 0)
    {
        if (global.monster[0] == false)
            thistarget = 1
    }
    if (thistarget == 1)
    {
        if (global.monster[1] == false)
            thistarget = 2
    }
    if (thistarget == 2)
    {
        if (global.monster[2] == false)
            thistarget = 3
        if (thistarget == 3 && global.monster[0] == true)
            thistarget = 0
        if (thistarget == 3 && global.monster[1] == true)
            thistarget = 1
        if (thistarget == 3)
            cancelattack = true
    }
    global.chartarget[argument0] = thistarget
    return;
}

function scr_tensionheal(tp) {
    global.tension += argument0
    if (global.tension > global.maxtension)
        global.tension = global.maxtension
    return;
}


