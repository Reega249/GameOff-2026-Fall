var right;
var left;
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
var space = keyboard_check(vk_space);
kick = keyboard_check(ord("Q"));
shoot = keyboard_check(ord("E"));
charge = keyboard_check(vk_shift);
movement_dir = right - left;

var is_grounded = place_meeting(x,y+1,tilemap);

switch(state) {
	case p_state.grounded:
	has_kicked = false;
	acel_x = clamp(((move_speed - abs(velo_x)) / 3), 0, move_speed);
	
	if (!has_kicked) {
		velo_x += acel_x * movement_dir;
	}
	if (!is_grounded) {
		state = p_state.airborne
		break;
	}
	
	
	
	
	if (space) {
		velo_y -= jump_height;
	}
	if (kick && !has_kicked && kick_grounded_refreshed) {
		kick_abil()
		break;
	}
	if (movement_dir == 0) {
		velo_x = lerp(velo_x, 0, 0.4);
		
	}
	break;
	
	case p_state.airborne:
	
	if (is_grounded) {
		state = p_state.grounded;
		velo_y -= velo_y;
		break;
	}
	if (kick && !has_kicked) {
		velo_y = 2;
		kick_abil()
	}
	if (!has_kicked) {
		velo_x = (move_speed * 0.90) * movement_dir;
	}
	velo_y = clamp(velo_y + p_grav, -99, 8)

	break;
	
	case p_state.kick_fusion:
	if (!is_grounded) {
		velo_y += 0.1;
		velo_x = lerp(velo_x, 0, 0.1);
	}
	else {
		velo_x = lerp(velo_x, 0, 0.05);
	}
	break;
	
}
if (!place_meeting(x, y+velo_y, tilemap)) {
	y =round(y+ velo_y);
}
else {
	velo_y =0;
}
// collision checker
if (!place_meeting(x + velo_x, y, tilemap)) {
	x += velo_x;
}
else {
	velo_x -= velo_x;
}

if (shoot && !shoot_recharge) {
	alarm[2] = shoot_timer;
	shoot_recharge = true;
	instance_create_layer(x +(10 * image_xscale),y - 8,"Instances",o_p_shot);
}

show_debug_message(velo_x);