if (event_data[? "event_type"] == "sprite event") {
	if (event_data[? "message"] == "charge") {
		if (check_player_sensor()) {
			hp = full_hp;
			state = e_state.alert;
			sprite_index = self_sprite
			if (image_xscale = -1) {
				mov_right = true;
			}
			else {
				mov_right = false;
			}
			alarm[1] = twitch_timer;
		}
		
	}
	
}
