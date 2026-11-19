// handles behavior
special = keyboard_check(ord("E"));
switch(state) {
	case e_state.passive:
	passive_movement();
	
	break
	
	case e_state.alert:
	alert_movement();
	
	break
	
	case e_state.possessed:
		if (special) {
		special_function();
		}
	possession_movement();
	
	break
	
	case e_state.destroyed:
	var grounded = place_meeting(x,y+1,tilemap);

	if (!grounded) {
		velo_y += e_grav;
	}
	show_debug_message(grounded);
	break;
	
}
if (!place_meeting(x, y+(velo_y), tilemap)) {
	y += velo_y;
}
else {
	velo_y -= velo_y;
}
// collision checker
if (!place_meeting(x + velo_x, y, tilemap)) {
	x += velo_x;
}
else {
	velo_x -= velo_x;
}
