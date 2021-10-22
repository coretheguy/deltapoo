global.entrance = 23
instance_create(0, 0, obj_persistentfadein)
event_user(7)


switch room {
	
	case room_test_dark: room_goto(room_shop_ch2_spamton) break;
	default: break;
}