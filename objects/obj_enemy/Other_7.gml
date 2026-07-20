// Return to walk after a one-shot attack or hit animation finishes.
if (anim_state == "attack" || anim_state == "hit")
{
	// Force image_speed to 1 before transitioning so there is no frozen frame.
	image_speed = 1;
	enemy_play_walk(true);
}
