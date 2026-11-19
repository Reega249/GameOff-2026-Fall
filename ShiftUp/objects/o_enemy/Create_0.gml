hp = 5;
full_hp = 5;
velo_x = 0;
velo_y = 0;
max_speed = 3;
acel_x = 0;
hit_timer = 20;
hit = false;
// behavior state
state = e_state.passive;
deactivated = false;
e_grav = 0.5;
in_air = false;
knock_backx = 5;
knock_backy = 3;
// friction
e_friction = 0.5;
// shader code
flash_alpha = 0;
flash_colour = c_aqua
// collision map
tilemap = layer_tilemap_get_id("place");
// self sprite storage
self_sprite = e_charger_s;
destroyed_sprite = e_destroyed_s;
// awareness rect

x_r = 96;
y_r = 32;
// special ability
special = keyboard_check(ord("E"));
// blur bloom effect
handler = shader_get_uniform(shGlow, "intensity");

value = 0.0;
// STATE MACHINE
// controls enemy behavior
enum e_state{
	passive,
	alert,
	possessed,
	off_screen,
	destroyed
}

function passive_movement() {
	velo_x = 0;
	velo_y = 0;
}

function alert_movement() {
	velo_x = 0;
	velo_y = 0;
}

function possession_movement() {
	velo_x = 0;
	velo_y = 0;
}
function dmg() {
	if (other.image_xscale == -1) {
	velo_x -= knock_backx;
	}
	else {
		velo_x += knock_backx;
	}
	velo_y -= knock_backy;
	if (!hit) {
		hp -= other.dmg;
		hit = true;
		alarm[0] = hit_timer;
	}
	if (hp <=0) {
		state = e_state.destroyed;
		sprite_index = destroyed_sprite;
		effect_create_depth(90,ef_ellipse,x,y, 3,c_aqua);
	}
	flash_alpha = 1;
}

function special_function() {
	velo_x = 0;
	velo_y = 0;
}

function check_player_sensor() {
	var presence = player.x > (x - x_r) && player.x < (x + x_r) && player.y > (y - y_r) && player.y < (y + 32)
	return presence
	
}