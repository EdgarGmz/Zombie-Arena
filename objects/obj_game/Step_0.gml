// If the game is NOT over...
if (!instance_exists(obj_game_over))
{
	// If the hero has run out of hitpoints...
	if (obj_hero.hitpoints <= 0)
	{
		// Destroy the player.
		with (obj_hero) instance_destroy();

		// Destroy any bullets.
		with (obj_hero_bullet) instance_destroy();

		// Destroy the enemies.
		with (obj_enemy) instance_destroy();

		// Destroy any xp pickups.
		with (obj_collectable) instance_destroy();

		// Destroy any health pickups.
		with (obj_heart) instance_destroy();

		// Pause all game function
		pause();

		// Create game over object.
		instance_create_layer(1920 / 2, 1080 / 2 - 150, "UpgradeScreen", obj_game_over);
	}
}

// If the game is over...
// We do this by checking is an end game screen is present.
if (!instance_exists(obj_upgrade) && !instance_exists(obj_template_complete))
{
	// If we have reached the experience goal...
	if (global.xp >= global.xp_goal)
	{
		// Destroy the enemies.
		with (obj_enemy) instance_destroy();

		// Destroy any bullets.
		with (obj_hero_bullet) instance_destroy();

		// Destroy any xp pickups.
		with (obj_collectable) instance_destroy();

		// Destroy any health pickups.
		with (obj_heart) instance_destroy();

		// Si se alcanzó la oleada objetivo para ganar el nivel seleccionado
		var _target_wave = 10;
		if (variable_global_exists("win_wave")) {
			_target_wave = global.win_wave;
		}
		
		if (global.level >= _target_wave)
		{
			// Desbloquear el siguiente nivel si ganamos el nivel actual
			if (variable_global_exists("selected_level")) {
				var _curr_unlocked = level_load_unlocked();
				if (global.selected_level == _curr_unlocked && _curr_unlocked < 5) {
					level_save_unlocked(_curr_unlocked + 1);
				}
			}

			// Create the template/level complete screen.
			instance_create_layer(1920 / 2, 1080 / 2, "UpgradeScreen", obj_template_complete);
		}
		else
		{
			// Level up!
			global.level += 1;

			// Execute function to go to the next wave.
			next_wave();

			// Create the upgrade screen.
			instance_create_layer(0, 0, "Instances", obj_upgrade_screen);
		}
	}
}

// If the game is not currently paused...
if (!global.paused)
{
	// Reduce spawner cooldown timer.
	spawn_enemy_cooldown--;

	// Checks if spawner has expired.
	if (spawn_enemy_cooldown <= 0)
	{
		// Calls spawn enemy function.
		spawn_enemy();
	}
}