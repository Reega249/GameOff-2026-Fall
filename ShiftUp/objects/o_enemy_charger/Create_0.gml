// Inherit the parent event
event_inherited();
// self sprite storage
destroyed_sprite = e_destroyed_big_s;
self_sprite = e_charger_s;
// awareness rect

x_r = 160;
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
	if (check_player_sensor()) {
		flash_alpha = 0.5;
		state = e_state.alert;
	}
	pace_tween += 0.5;
	//velo_x = velo_x + sin(pace_tween*0.1) * 10;
	velo_x = sin(pace_tween*0.1) * 10
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
	if (velo_x != 0) {
	velo_x = lerp(velo_x, 0, 0.3);
}
}

function possession_movement() {
	var right = keyboard_check(vk_right);
	var left = keyboard_check(vk_left);
	acel_x = (max_speed - abs(velo_x)) / 3;
	var movement_dir = right - left;
	velo_x += acel_x * movement_dir;
	if (movement_dir == 0 && !special) {
		velo_x = lerp(velo_x, 0, 0.1);
	}
}

function special_function() {
	var abilchargespeed = 15;
	acel_x = clamp(((abilchargespeed - abs(velo_x)) / 15),0,abilchargespeed);
	velo_x += acel_x * -image_xscale;
	if (flash_alpha = 0) {
		flash_alpha =1;
	}
	
}