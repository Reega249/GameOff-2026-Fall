if (other.image_xscale == -1) {
	velo_x -= knock_backx;
}
else {
	velo_x += knock_backx;
}
velo_y -= knock_backy;
if (!hit) {
	hp -= other.dmg;
	hit = true;
	alarm[0] = hit_timer;
}
if (hp <=0) {
	deactivated = true;
	instance_destroy();
}
flash_alpha = 1;