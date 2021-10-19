function scr_spareanim() {
    spareanim = instance_create(x, y, obj_spareanim)
    spareanim.sprite_index = sprite_index
    spareanim.sprite_index = sparedsprite
    spareanim.image_index = 0
    spareanim.image_xscale = image_xscale
    spareanim.image_yscale = image_yscale
    return;
}



function scr_recruit() {
    if (recruitable == true && global.flag[61] == 0)
    {
        if (global.flag[(global.monstertype[myself] + 600)] >= 0 && global.flag[(global.monstertype[myself] + 600)] < 1 && recruitcount > 0)
        {
            if (recruitcount == -1)
            {
                scr_recruit_info(global.monstertype[myself])
                recruitcount = _recruitcount
            }
            global.flag[(global.monstertype[myself] + 600)] += (1 / recruitcount)
            if (global.flag[(global.monstertype[myself] + 600)] > 1)
                global.flag[(global.monstertype[myself] + 600)] = 1
            snd_play(snd_sparkle_gem)
            _recruitanim = instance_create(global.monsterx[myself], (global.monstery[myself] - 40), obj_recruitanim)
            _recruitanim.firstnumber = round((global.flag[(global.monstertype[myself] + 600)] / (1 / recruitcount)))
            _recruitanim.secondnumber = recruitcount
        }
    }
    return;
}

function scr_recruit_info(monster) {
    _recruitcount = 1
    _sprite = spr_darkconfigbt
    _spritex = 0
    _spritey = 0
    _imagespeed = 0
    _name = (stringsetloc("Known Quantity ", "scr_recruit_info_slash_scr_recruit_info_gml_10_0") + string(argument0))
    _desc = stringsetloc("It is known.", "scr_recruit_info_slash_scr_recruit_info_gml_11_0")
    _like = " "
    _dislike = " "
    _chapter = 0
    _level = 0
    _attack = 0
    _defense = 0
    _element = " "
    _dialogueboxes = 1
    _dialogue[0] = stringsetloc("%%", "scr_recruit_info_slash_scr_recruit_info_gml_22_0")
    _placeable = 1
    switch argument0
    {
        case 5:
            _sprite = spr_diamond_overworld
            _name = stringsetloc("Rudinn", "scr_recruit_info_slash_scr_recruit_info_gml_29_0")
            _desc = stringsetloc("Said to be someone's best friend, but maybe not. Shine on, you lazy diamond!", "scr_recruit_info_slash_scr_recruit_info_gml_30_0")
            _like = stringsetloc("Shiny Things", "scr_recruit_info_slash_scr_recruit_info_gml_31_0")
            _dislike = stringsetloc("Effort", "scr_recruit_info_slash_scr_recruit_info_gml_32_0")
            _chapter = 1
            _level = 2
            _attack = 4
            _defense = 5
            _element = stringsetloc("JEWEL", "scr_recruit_info_slash_scr_recruit_info_gml_37_0")
            _dialogue[0] = stringsetloc("* Hey^1, boss^1! I'll have a Dark Candy Starfait!/%", "scr_recruit_info_slash_scr_recruit_info_gml_38_0")
            break
	}
	
	if (_sprite == spr_darkconfigbt)
    {
        _sprite = floor(random(500))
        _placeable = 0
    }
    _recruitcountcurrent = round((global.flag[(argument0 + 600)] / (1 / _recruitcount)))
    return;
}
