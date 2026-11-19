// Inherit the parent event
event_inherited();
hp = 2;
self_sprite = e_flier_s
destroyed_sprite = e_destroyed_s;
// variable that determines which direction this guy goes in
max_speed = 2;
flip = 1;
start_y = y;
waveHeight = 15;
acel_y = 0;
function passive_movement() {
	velo_x = max_speed * flip;
	if (place_meeting(x + velo_x, y, tilemap)) {
		flip = -flip;
	}
	velo_y = (sin(current_time/100) *2);
}

function alert_movement() {
	velo_x = 0;
	velo_y = 0;
}

function possession_movement() {
	var right = keyboard_check(vk_right);
	var left = keyboard_check(vk_left);
	var up = keyboard_check(vk_up);
	var down = keyboard_check(vk_down);
	acel_x = (max_speed - abs(velo_x)) / 3;
	acel_y = (max_speed - abs(velo_y)) / 3;
	var movement_dir = right - left;
	var hori_dir = down - up;
	velo_x += acel_x * movement_dir;
	velo_y += acel_y * hori_dir;
	if (movement_dir == 0) {
		velo_x = lerp(velo_x, 0, 0.1);
	}
	if (hori_dir == 0) {
		velo_y = lerp(velo_y, 0, 0.1);
	}
}