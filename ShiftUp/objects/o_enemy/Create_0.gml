hp = 5;
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

// awareness rect

x_r = 96;
y_r = 32;
// STATE MACHINE
// controls enemy behavior
enum e_state{
	passive,
	alert,
	possessed,
	off_screen
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