global.entrance = 24
event_user(7)
instance_create(0, 0, obj_persistentfadein)


switch room {
	
	case room_dark_test2: room_goto(room_dw_city_showcase) break
	default: room_goto_next() break
	
}