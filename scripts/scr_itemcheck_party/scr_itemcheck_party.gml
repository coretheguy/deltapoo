function scr_armorcheck_equipped_party(char) {
    var __totalwearing = 0
    for (var __weari = 0; __weari < 3; __weari++)
    {
        if (global.char[__weari] != 0)
            __totalwearing += scr_armorcheck_equipped(global.char[__weari], argument0)
    }
    return __totalwearing;
}

