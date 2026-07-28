// Define a function to execute the shooting attack.
function shooting_attack()
{
	// If an enemy is found...
	if (instance_exists(nearest_enemy))
	{
		// Get the direction from the hero's chest to the enemy's center.
		var _direction = point_direction(x, y - 120 * base_scale, nearest_enemy.x, nearest_enemy.y - 40);

		// Get the angle we should start creating bullets aiming towards.
		var _angle_difference = (global.shooting.number_of_shots - 1) * 20;

		// The starting angle.
		var _angle = -_angle_difference / 2;

		// Play the sound effect.
		audio_play_sound(snd_lightning_throw, 0, false);

		// Repeat the following code for each bullet we need to spawn.
		repeat (global.shooting.number_of_shots)
		{
			// Create a bullet at chest height and assign it to temp variable _bullet.
			var _bullet = instance_create_layer(x, y - 120 * base_scale, "Instances", obj_hero_bullet);

			// Change values of the bullet...
			with (_bullet)
			{
				// Set the bullet's direction.
				direction = _direction + _angle;

				// Set speed of the bullet.
				speed = 15;

				// Rotate the bullet to face it's moving direction.
				image_angle = direction;
			}

			// Increment the angle for the next bullet.
			_angle += 20;
		}
	}
}