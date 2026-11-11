// Inherit the parent event
event_inherited();

// awareness rect

x_r = 96;
y_r = 32;
state = e_state.passive;
twitch_timer = 120;
//
charge_timer = 240;
charge_dir = 1;
charge_speed = 20;

// for math movements
pace_tween = 0;
mov_right = true;
alarm[1] = twitch_timer;
function passive_movement() {
	if (player.x > (x - x_r) && player.x < (x + x_r) && player.y > (y - y_r) && player.y < (y + 32)) {
		state = e_state.alert;
	}
	if (mov_right) {
		pace_tween += 0.1;
	}
	else {
		pace_tween -= 0.1;
	}
	velo_x = pace_tween;
	if (velo_x != 0) {
		velo_x = velo_x * e_friction;
	}
}

function alert_movement() {
	acel_x = (charge_speed - abs(velo_x)/2);
	velo_x += acel_x * charge_dir;
	if (player.x > x && image_xscale = -1) {
		velo_x = velo_x * (alarm[1]/500);
	}
	else if (player.x > x && image_xscale = 1) {
		velo_x = velo_x * 0.09;
	}
	if (player.x < x && image_xscale = 1) {
		velo_x = velo_x * (alarm[1]/500);
	}
	else if (player.x < x && image_xscale = -1) {
		velo_x = velo_x * 0.09;
	}
	if (velo_x != 0) {
		velo_x = velo_x * (alarm[1]/500);
	}
	
}

function possession_movement() {
	var right = keyboard_check(vk_right);
	var left = keyboard_check(vk_left);
	acel_x = clamp(((max_speed - abs(velo_x)) / 3), 0, max_speed);
	var movement_dir = right - left;
	velo_x += acel_x * movement_dir;
}