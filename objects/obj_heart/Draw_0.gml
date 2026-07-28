// Checks if the game is paused.
if (!global.paused)
{
	// Add to the timer to make the float effect
	float_timer += delta_time * 0.000001 * 10;
}

// Draw the shadow sprite first.
draw_sprite_ext(spr_shadow, 0, x, y, 0.5, 0.5, 0, c_white, 0.5);

// Draw the sprite at the appropriate height
draw_sprite(sprite_index, 0, x, y + sin(float_timer) * 10);