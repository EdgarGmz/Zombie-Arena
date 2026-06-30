// If mouse is over this button (adjusted for GUI layer)...
if (device_mouse_x_to_gui(0) > bbox_left && device_mouse_x_to_gui(0) < bbox_right && device_mouse_y_to_gui(0) > bbox_top && device_mouse_y_to_gui(0) < bbox_bottom)
{
	// Reduce target scale size.
	target_scale = 0.95;

	// If left mouse button is pressed...
	if (mouse_check_button_pressed(mb_left))
	{
		// Play click sound effect.
		audio_play_sound(snd_click, 0, false);

		// Sets click state to true.
		is_clicked = true;

		// Reduce target scale size further.
		target_scale = 0.9;
	}

	// Checks if mouse has previously been clicked on this button.
	if (is_clicked)
	{
		// And the left mouse button is clicked...
		if (mouse_check_button_released(mb_left))
		{
			// Play click sound effect.
			audio_play_sound(snd_ui_select, 0, false);

			// Start the next unlocked level without returning to level select.
			if (variable_global_exists("selected_level") && global.selected_level < 5)
			{
				level_start(global.selected_level + 1);
			}
		}
	}
}
else
{
	// Reset target scale size.
	target_scale = 1.0;
}

// Lerp scale values to target scale.
image_xscale = lerp(image_xscale, target_scale, 0.1);
image_yscale = lerp(image_yscale, target_scale, 0.1);
