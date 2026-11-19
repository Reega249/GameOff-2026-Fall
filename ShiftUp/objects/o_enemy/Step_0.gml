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
	velo_x = lerp(velo_x, 0, 0.1);
	velo_y = lerp(velo_y, 0, 0.1);
}


var grounded = place_meeting(x,y+1,tilemap);

if (!grounded) {
	velo_y += e_grav;
}

if (!place_meeting(x, y+(velo_y), tilemap)) {
	y =round(y+ velo_y);
}
else {
	velo_y =0;
}
// collision checker
if (!place_meeting(x + velo_x, y, tilemap)) {
	x += velo_x;
}
else {
	velo_x -= velo_x;
}

