// collision tester
 tilemap = layer_tilemap_get_id("place");
 
 
// movement premise
velo_x = 0;
velo_y = 0;
acel_x = 0;
move_speed = 4;
jump_height = 10;
movement_dir = 0;
p_friction = 1;

p_grav = 0.5;
state = p_state.grounded;
kick_timing = 12;
kick_cooldown = 45;
kick_grounded_refreshed = true;
has_kicked = false;
kick_speed = 12;
kick = false;


shoot = false;
shoot_recharge = false;
shoot_timer =25;
charge = false;

// STATE MACHINE
// controls aerial and ground movement
enum p_state{
	airborne,
	grounded,
	kick_fusion
}

function kick_abil() {
	state = p_state.kick_fusion
	alarm[0] = kick_timing;
	alarm[1] = kick_cooldown;
	kick_grounded_refreshed = false;
	has_kicked = true;
	velo_x = 0;
	velo_x += kick_speed * image_xscale;
}