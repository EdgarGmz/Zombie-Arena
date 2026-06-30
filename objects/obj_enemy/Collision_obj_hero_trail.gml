// If our hitpoints is over 0,
// AND we are not currently playing the hit animation.
if (hitpoints > 0 && anim_state != "hit")
{
	// Choose a random sound effect for being hit.
	var _sound = choose(snd_melee_hit_1, snd_melee_hit_2, snd_melee_hit_3);

	// Play the chsoen sound.
	audio_play_sound(_sound, 0, false);

	// Set the healthbar timer to 60.
	// This will cause the healthbar to be visible for that many game steps.
	show_healthbar = 60;

	// Reduce hitpoints by the damage caused by the trail weapon.
	hitpoints -= global.trail[? "damage"];

	// Create text popup to indicate damage.
	var _text = instance_create_layer(x, y, "UpgradeScreen", obj_text_popup);

	// Set text to the damage amount.
	_text.text = -global.trail[? "damage"];

	// Play the hit reaction animation.
	enemy_play_hit();

	// If hitpoints has reached zero...
	if (hitpoints <= 0)
	{
		// Destroy this instance.
		instance_destroy();
	}
}