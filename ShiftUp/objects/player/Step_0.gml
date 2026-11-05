var right;
var left;
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
var space = keyboard_check(vk_space);
movement_dir = right - left;

switch(state) {
	case p_state.grounded:
	velo_x = move_speed * movement_dir;
	if (!place_meeting(x, y+18, tilemap)) {
		state = p_state.airborne
		break;
	}
	else {
		velo_y = 0;
	}
	if (space) {
	velo_y -= jump_height;
	}
	break;
	
	case p_state.airborne:
	velo_x = move_speed * movement_dir;
	velo_y += p_grav;
	if (place_meeting(x, y+18, tilemap)) {
		state = p_state.grounded;
	}
	
}

show_debug_message(velo_y);
y += velo_y;
x += velo_x;

