
switch(state) {
	case p_state.kick_fusion:
	if (other.state != e_state.destroyed) {
		kick = false;
		visible = false;
		state = p_state.possession;
		other.state = e_state.possessed;
		possession_target = other;
		other.flash_alpha = 1;
		possess_x = other.x;
		possess_y = other.y;
	}
	break;
	
	case p_state.possession:
	possess_x = other.x;
	possess_y = other.y;
	break;
	
	case p_state.airborne:
	if (other.state != e_state.destroyed) {
		dmghit();
	}
	break;
	
	case p_state.grounded:
	if (other.state != e_state.destroyed) {
		dmghit();
	}
	break;
}
	

