global.auto_shoot = true;      // Disparo automático
global.dificultad = 1;         // 0: Fácil, 1: Normal, 2: Pesadilla

// Not paused by default.
global.paused = false;

// Declare pause function.
function pause()
{
	// Pause the game.
	global.paused = true;

	// Apply the following code to all instances...
	with (all)
	{
		// Save the instance's speed.
		paused_speed = speed;

		// Save the animation speed.
		paused_animation = image_speed;

		// Stop moving the instance.
		speed = 0;

		// Stop animation.
		image_speed = 0;
	}
}