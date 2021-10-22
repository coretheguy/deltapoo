if scr_debug()
{
	
	if keyboard_check_pressed(ord("O")) {
		
		colvis = !colvis
		scr_debug_print("collision visibility " + (colvis = true ? "ON" : "OFF"))
	}
	
	
	with obj_solidblock {
		
		if object_index != obj_npc_room
			visible = other.colvis
	}
	
	with obj_solidenemy
		visible = other.colvis
}
