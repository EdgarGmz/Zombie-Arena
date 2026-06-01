// If the game is paused...
if (global.paused)
{
	// Exit this event while paused.
	exit;
}

// Execute player movement function.
player_movement();

// Execute function that keeps the player in the room.
keep_in_room();

// Set depth to minus our y position.
// This is also done in enemies, with the
// result being instances higher up on the screen
// being drawn first.
depth = -y;

// Find the nearest enemy.
// And reset the distance to some high number.
nearest_enemy = instance_nearest(x, y, obj_enemy);
nearest_distance = 1000;

// If an enemy instance is found.
if (nearest_enemy)
{
	// Get the distance to that enemy.
	nearest_distance = point_distance(x, y, nearest_enemy.x, nearest_enemy.y);
}

// Cambiar el modo de disparo automático presionando la tecla "T" o el botón Select del mando
if (keyboard_check_pressed(ord("T")) || (gamepad_is_connected(0) && gamepad_button_check_pressed(0, gp_select)))
{
	global.auto_shoot = !global.auto_shoot;
	
	// Mostrar notificación visual flotante
	var _text = instance_create_layer(x, y - 80, "Instances", obj_text_popup);
	if (global.auto_shoot)
	{
		_text.text = "DISPARO AUTO: SI";
	}
	else
	{
		_text.text = "DISPARO AUTO: NO";
	}
}

// Reduce cooldown timer for attacks.
hero_shoot_cooldown--;
hero_swipe_cooldown--;
hero_trail_cooldown--;

// Check if function cooldown is finished.
if (hero_shoot_cooldown <= 0)
{
	// Asegurar que no sea negativo para disparo instantáneo al presionar la tecla
	hero_shoot_cooldown = 0;

	// Si auto_shoot está activo, dispara solo. Si no, requiere Barra Espaciadora o botón A/Gatillo del mando.
	var _should_shoot = global.auto_shoot;
	if (!_should_shoot)
	{
		_should_shoot = keyboard_check(vk_space) || (gamepad_is_connected(0) && (gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_shoulderrb)));
	}

	if (_should_shoot)
	{
		// Call function.
		hero_shoot();
	}
}

// Check if function cooldown is finished.
if (hero_swipe_cooldown <= 0)
{
	// Call function.
	hero_swipe();
}

// Check if function cooldown is finished.
if (hero_trail_cooldown <= 0)
{
	// Call function.
	hero_trail();
}