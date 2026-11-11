if (state = p_state.kick_fusion) {
	kick = false;
	visible = false;
	state = p_state.possession;
	other.state = e_state.possessed;
	possession_target = other;
	other.flash_alpha = 1;
}


switch(state) {
	case p_state.kick_fusion:
	kick = false;
	visible = false;
	state = p_state.possession;
	other.state = e_state.possessed;
	possession_target = other;
	other.flash_alpha = 1;
	break;
	
	case p_state.possession:
	possess_x = other.x;
	possess_y = other.y;
	break;
	
	case p_state.airborne:
	dmghit();
	break;
	
	case p_state.grounded:
	dmghit()
	break;
}
	

