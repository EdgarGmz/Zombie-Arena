// Return to walk after a one-shot attack or hit animation finishes.
if (anim_state == "attack" || anim_state == "hit")
{
	enemy_play_walk(true);
}
