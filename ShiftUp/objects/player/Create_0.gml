// collision tester
 tilemap = layer_tilemap_get_id("place");
 
 
// movement premise
velo_x = 0;
velo_y = 0;
move_speed = 4;
jump_height = 12;
movement_dir = 0;
p_friction = 1;

p_grav = 1;
state = p_state.grounded;


// STATE MACHINE
// controls aerial and ground movement
enum p_state{
	airborne,
	grounded
}