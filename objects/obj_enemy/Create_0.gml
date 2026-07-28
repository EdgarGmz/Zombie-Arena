// Set base scale to 0.75 (reduced by 25% to fit new background dimensions)
// Child enemies can override enemy_base_scale before calling event_inherited().
if (variable_instance_exists(id, "enemy_base_scale"))
{
	base_scale = enemy_base_scale;
}
else
{
	base_scale = 0.75;
}
image_xscale = base_scale;
image_yscale = base_scale;

// Create variable for max hitpoints.
hitpoints_max = 2 * global.enemy_health_bonus;

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
speed = 4;

// Create variable to show/hide the healthbar.
show_healthbar = 0;



// Animation state for smoother transitions between walk, attack and hit.
anim_state = "walk";
walk_frame = 0;

enemy_play_walk = function(_preserve_frame = true)
{
	// Guard: already walking with the right sprite.
	if (anim_state == "walk" && sprite_index == walk_sprite)
	{
		exit;
	}

	var _prev_xscale = image_xscale;
	var _prev_yscale = image_yscale;

	anim_state = "walk";
	sprite_index = walk_sprite;
	image_speed = 1;

	if (_preserve_frame)
	{
		var _frames = sprite_get_number(walk_sprite);
		if (_frames > 0)
		{
			image_index = walk_frame mod _frames;
		}
	}
	else
	{
		image_index = 0;
	}

	// Restore scale so the sprite doesn't jump/flip on transition.
	image_xscale = _prev_xscale;
	image_yscale = _prev_yscale;
};

enemy_play_attack = function()
{
	if (anim_state == "attack")
	{
		exit;
	}

	if (anim_state == "walk")
	{
		walk_frame = floor(image_index);
	}

	var _prev_xscale = image_xscale;
	var _prev_yscale = image_yscale;

	anim_state = "attack";
	sprite_index = attack_sprite;
	image_index = 0;
	image_speed = 1;

	// Restore scale so the sprite doesn't jump/flip on transition.
	image_xscale = _prev_xscale;
	image_yscale = _prev_yscale;
};

enemy_play_hit = function()
{
	if (anim_state == "hit")
	{
		exit;
	}

	if (anim_state == "walk")
	{
		walk_frame = floor(image_index);
	}

	var _prev_xscale = image_xscale;
	var _prev_yscale = image_yscale;

	anim_state = "hit";
	sprite_index = hit_sprite;
	image_index = 0;
	image_speed = 1;

	// Restore scale so the sprite doesn't jump/flip on transition.
	image_xscale = _prev_xscale;
	image_yscale = _prev_yscale;
};