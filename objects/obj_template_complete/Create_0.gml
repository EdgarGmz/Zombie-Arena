// Stop all audio.
audio_stop_all();

// Play the win game jingle.
audio_play_sound(snd_win, 0, false);

var _can_continue = false;
if (variable_global_exists("selected_level") && global.selected_level < 5)
{
	_can_continue = level_can_play(global.selected_level + 1);
}

// Create exit button.
instance_create_layer(x - (_can_continue ? 280 : 200), 1080 - 330, "Buttons", obj_button_exit);

// Create retry button.
instance_create_layer(_can_continue ? x : x + 200, 1080 - 330, "Buttons", obj_button_retry);

// Continue straight into the next level when it is unlocked.
if (_can_continue)
{
	instance_create_layer(x + 280, 1080 - 330, "Buttons", obj_button_next_level);
}