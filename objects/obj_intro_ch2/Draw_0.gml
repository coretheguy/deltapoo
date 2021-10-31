if show_queen
{
    if queen_animate
    {
        queen_siner++
        queen_sprite_index = (queen_siner / 3)
    }
    else
        queen_sprite_index = 0
    draw_sprite_ext(queen_sprite, queen_sprite_index, (view_wport[0] / 4), queen_y_pos, 1, 1, 0, c_white, queen_alpha)
}
else
{
    if (init == false && con == 1)
    {
        logopieces = 0
        init = true
        for (i = 0; i < 9; i++)
            drawlogopart[i] = 0
        con = 2
        logotimer = 0
    }
    if (con == 2)
    {
        logotimer++
        if ((logotimer % 8) == 0 && logotimer < 80)
        {
            snd_play_x(snd_noise, 0.8, (0.5 + random(1)))
            if (logopieces == 0)
                drawlogopart[0] = 1
            if (logopieces == 1)
                drawlogopart[8] = 1
            if (logopieces == 2)
                drawlogopart[1] = 1
            if (logopieces == 3)
                drawlogopart[7] = 1
            if (logopieces == 4)
                drawlogopart[2] = 1
            if (logopieces == 5)
                drawlogopart[6] = 1
            if (logopieces == 6)
                drawlogopart[3] = 1
            if (logopieces == 7)
                drawlogopart[5] = 1
            if (logopieces == 8)
                drawlogopart[4] = 1
            logopieces++
        }
        for (i = 0; i < 9; i++)
        {
            if (drawlogopart[i] == 1)
                draw_sprite_ext(IMAGE_LOGO_CENTER_SEPARATE, i, 160, 100, 1, 1, 0, c_white, 1)
        }
        if (logotimer == 120)
            snd_play(snd_queen_laugh_title)
        if (logotimer >= 120)
        {
            draw_set_font(fnt_mainbig)
            draw_set_color(c_white)
            draw_text_ext(105, 120, "CHAPTER " + string(chstr), 10, 900)
            scr_84_set_draw_font("mainbig")
        }
		
		if logotimer >= 160 and logotimer <= 180 {
			
			snd_stop(snd_won)
			snd_play(snd_won)
			chstr++
		}
		
		if logotimer == 180
		{
			chstr = "???"
			
		}
		if logotimer >= 200 {
			
			if logotimer == 200
				snd_play(snd_impact)
				
			orgincol = draw_get_color()
			draw_set_color(c_black)
			xx = 180
			yy = 100
			offs = 2
			scal = 1.2
			scal2 = scal
			draw_text_transformed(xx - offs, yy - offs, "DECOMP", scal2, scal2, 25)
			draw_text_transformed(xx + offs, yy - offs, "DECOMP", scal2, scal2, 25)
			draw_text_transformed(xx - offs, yy + offs, "DECOMP", scal2, scal2, 25)
			draw_text_transformed(xx + offs, yy + offs, "DECOMP", scal2, scal2, 25)
			draw_set_color(c_white)
			draw_text_transformed(xx, yy, "DECOMP", scal, scal, 25)
			
			draw_set_color(orgincol)
		}
		
		//if logotimer >= 230
		//	draw_text_transformed(105, 140, "AVAILABLE SOMETIME", 0.6, 0.6, 0)
			
		//if logotimer >= 250
		//	draw_text_transformed(105, 160, "MAYBE LATER TODAY", 0.5, 0.5, 0)
			
		//if logotimer >= 270
		//	draw_text_transformed(105, 180, "POSSIBLY", 0.4, 0.4, 0)
			
		//if logotimer >= 272
		//	draw_text_transformed(105, 190, "PLEASE RESPECT THE DOG THO", 0.3, 0.3, 0)
			
		//if logotimer >= 274
		//	draw_text_transformed(105, 200, "OR I HAVE TO TAKE IT DOWN", 0.3, 0.3, 0)
			
		//if logotimer >= 277
		//	draw_text_transformed(105, 210, "YOU NEED GAMEMAKER STUDIO 2 ALSO", 0.2, 0.2, 0)
			
		//if logotimer >= 278
		//	draw_text_transformed(105, 215, "UH OH HERE COMES THE FILE SELECT", 0.1, 0.1, 0)
			
        if (logotimer >= 280)
            room_goto(PLACE_MENU)
    }
}
