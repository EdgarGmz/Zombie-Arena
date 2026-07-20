// Set depth to negative y.
// This will cause instances to draw from
// the top of the screen to the bottom, mimicking a 3/4 camera angle.
depth = -y;

// Set direction towards the hero.
direction = point_direction(x, y, obj_hero.x, obj_hero.y);

// If horizontal speed is NOT 0.
if (hspeed != 0)
{
	// Set our xscale to the sign of hspeed
	// (can only be -1 or 1 at this point) multiplied by base_scale.
	// Only update when actually moving to avoid flipping during attack/hit.
	if (anim_state == "walk")
	{
		image_xscale = sign(hspeed) * base_scale;
	}
}

// Keep yscale always equal to base_scale to avoid the sprite shrinking.
image_yscale = base_scale;

// Keep the walk cycle frame so returning from attack/hit looks smoother.
if (anim_state == "walk")
{
	walk_frame = floor(image_index);

	// Make sure we are using the walk sprite (safety check).
	if (sprite_index != walk_sprite)
	{
		enemy_play_walk(true);
	}
	
	// Scale animation speed to movement speed for a natural look.
	// At speed=4 we play at image_speed=1. Faster enemies animate faster.
	var _spd = point_distance(0, 0, hspeed, vspeed);
	image_speed = max(0.5, _spd / 4);
}