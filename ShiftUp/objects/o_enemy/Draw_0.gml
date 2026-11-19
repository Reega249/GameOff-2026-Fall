draw_self()

// flash event
if (flash_alpha > 0) {
	shader_set(shFlash);
	draw_sprite_ext(sprite_index, image_index, x,y,image_xscale,image_yscale,image_angle, flash_colour, flash_alpha);
	shader_reset();
}

if (state == e_state.destroyed && check_player_sensor()) {
	if (value < 0.5) {
		value += 0.02;
	}
	shader_set(shGlow);
	shader_set_uniform_f(handler, value);
	shader_set_uniform_f(shader_get_uniform(shGlow, "alpha_tint"), value);
	draw_self();
	shader_reset();
}
else if (state == e_state.destroyed) {
	if (value > 0) {
		value -= 0.02;
		shader_set(shGlow);
		shader_set_uniform_f(handler, value);
		shader_set_uniform_f(shader_get_uniform(shGlow, "alpha_tint"), value);
		draw_self();
		shader_reset();
	}
}
