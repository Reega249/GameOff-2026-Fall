draw_self()

// flash event
if (flash_alpha > 0) {
	shader_set(shFlash);
	draw_sprite_ext(sprite_index, image_index, x,y,image_xscale,image_yscale,image_angle, flash_colour, flash_alpha);
	shader_reset();
}