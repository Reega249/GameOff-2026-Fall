if (event_data[? "event_type"] == "sprite event") {
	if (event_data[? "message"] == "charge") {
		if (player.x > (x - x_r) && player.x < (x + x_r) && player.y > (y - y_r) && player.y < (y + 32)) {
			hp = full_hp;
			state = e_state.alert;
			sprite_index = self_sprite
			velo_x = 1;
		}
		
	}
	
}

