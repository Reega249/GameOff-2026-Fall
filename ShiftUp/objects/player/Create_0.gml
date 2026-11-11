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
kick_cooldown = 20;
kick_grounded_refreshed = true;
has_kicked = false;
kick_speed = 12;
kick = false;


shoot = false;
shoot_recharge = false;
shoot_timer =25;
charge = false;

// hit
hit = false;
invulnerable = false;
invul_timer = 90;
hit_timer = 30;

// possesion mechanics
possess_x = 0;
possess_y = 0;
possession_target = undefined;
// STATE MACHINE
// controls aerial and ground movement
enum p_state{
	airborne,
	grounded,
	kick_fusion,
	possession
}

function kick_abil() {
	if (state = p_state.possession) {
		hit= true;
		alarm[3] = kick_cooldown;
		state = p_state.airborne;
		velo_y -= jump_height/2;
		velo_x = move_speed * image_xscale;
		possession_target.state = e_state.alert;
		possession_target.flash_alpha = 1;
		visible = true;
	}
	else {
		state = p_state.kick_fusion
		alarm[0] = kick_timing;
		alarm[1] = kick_cooldown;
		kick_grounded_refreshed = false;
		has_kicked = true;
		velo_x = 0;
		velo_x += kick_speed * image_xscale;
	}
}

function dmghit() {
	if (!hit && !invulnerable) {
		hit = true;
		invulnerable = true;
		alarm[4] = invul_timer;
		alarm[3] = hit_timer;
		velo_x += 5 * -(image_xscale);
		velo_y -= 6;
	}
}