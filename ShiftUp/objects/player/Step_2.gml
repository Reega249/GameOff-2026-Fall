
switch(state) {
	case p_state.grounded:
	if (movement_dir == 0) {
	sprite_index = p_idle;
	}
	else {
		sprite_index = p_run;
	}
	
	break;
	
	case p_state.airborne:
	if (velo_y > 0) {
	image_index = 1;
	}
	else if (velo_y < 0) {
		sprite_index = p_jump;
		image_index = 0;
	}
	break;
	
	case p_state.kick_fusion:
	if (has_kicked) {
		sprite_index = p_kick;
	}
	break;
	
}
if (movement_dir >= 1) {
	image_xscale = 1;
}
else if (movement_dir <= -1) {
	image_xscale = -1;
}

if (shoot) {
	if (movement_dir != 0) {
		sprite_index = p_run_gun;
	}
	else {
		sprite_index = p_gun;
	}
}

if (charge) {
	sprite_index = p_charge;
}

