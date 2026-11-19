// Inherit the parent event
event_inherited();
self_sprite = e_crawler_s
destroyed_sprite = e_destroyed_s;
// variable that determines which direction this guy goes in
max_speed = 2;
flip = 1;
function passive_movement() {
	velo_x = 2 * flip;
	if (place_meeting(x + velo_x, y, tilemap)) {
		flip = -flip;
	}
}

function alert_movement() {
	state = e_state.passive;
}

function possession_movement() {
	var right = keyboard_check(vk_right);
	var left = keyboard_check(vk_left);
	acel_x = (max_speed - abs(velo_x)) / 3;
	var movement_dir = right - left;
	velo_x += acel_x * movement_dir;
	if (movement_dir == 0) {
		velo_x = lerp(velo_x, 0, 0.1);
	}
}

function special_function() {
	// the crawler's special ability is that he is small.
	// so don't worry
}