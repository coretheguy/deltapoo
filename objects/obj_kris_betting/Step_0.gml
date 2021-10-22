if con = 1 {
	
	if button1_p() {
		
		gamble = true
		with obj_writer
			instance_destroy()
	}
	
	if gamble = true {
			bet = choose(0.5, 0.65, 0.70, 0.77, 0.85, 0.9, 1, 1.12, 1.35, 1.5)
			con = 2
	}
}

if con = 2 {
	
	with creator
		kris_bet = bet
	global.msg[0] = stringset("* Kris bets the dice will land on " + string(bet) + "!/%")
	scr_battletext_default()
	con = 3
}

if con = 3 and !i_ex(obj_writer) {
	
	with obj_herokris
		visible = true
	with obj_pippins_enemy {
		if acting = 2
			actcon = 16
	}
	instance_destroy()
}

//case 2: realmult = 2 break
//		case 3: realmult = 1.5 break
//		case 4: realmult = 1.35 break
//		case 5: realmult = 1.12 break
//		case 6: realmult = 1 break
//		case 7: realmult = 0.9 break
//		case 8: realmult = 0.85 break
//		case 9: realmult = 0.77 break
//		case 10: realmult = 0.70 break
//		case 11: realmult = 0.65 break
//		case 12: realmult = 0.5 break