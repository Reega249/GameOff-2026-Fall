switch(state) {
	case e_state.passive:
	pace_tween = 0;
	velo_x = 0;
	mov_right = !mov_right;
	alarm[1] = twitch_timer;
	break;
	
	case e_state.alert:
	flash_alpha = 1;
	alarm[1] = charge_timer;
	var target_x = player.x;
	var target_y = player.y;
	if (player.x > x) {
		charge_dir = 1;
		velo_x = charge_speed;
	}
	else {
		charge_dir = -1;
		velo_x -= charge_speed;
	}
	break;
	
	
	case e_state.possessed:
	alarm[1] = 400;
	break;
}