if (state != p_state.possession) {
	var is_grounded = place_meeting(x,y+1,tilemap);
	if (is_grounded) {
		state = p_state.grounded;
	}
	else {
		state = p_state.airborne;
	}
	velo_x = 0;
}