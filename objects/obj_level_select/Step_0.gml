// Obtener posición del ratón en la interfaz GUI
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Procesar interacción de cada botón
var _n = array_length(buttons);
for (var _i = 0; _i < _n; _i++) {
	var _btn = buttons[_i];
	
	// Detectar colisión/hover considerando coordenadas centradas
	var _over = (_mx >= _btn.bx - _btn.bw / 2 && _mx <= _btn.bx + _btn.bw / 2 &&
	             _my >= _btn.by - _btn.bh / 2 && _my <= _btn.by + _btn.bh / 2);
				 
	_btn.hover = _over;
	
	if (_over) {
		if (mouse_check_button_pressed(mb_left)) {
			_btn.clicked = true;
			audio_play_sound(snd_click, 0, false);
		}
	} else {
		if (mouse_check_button_released(mb_left)) {
			_btn.clicked = false;
		}
	}
	
	// Si se suelta el clic estando encima, ejecutar acción
	if (_btn.clicked && _over && mouse_check_button_released(mb_left)) {
		_btn.clicked = false;
		audio_play_sound(snd_ui_select, 0, false);
		
		// Lógica según el tipo de botón
		switch (_btn.type) {
			case "difficulty":
				selected_difficulty = _btn.value;
				break;
				
			case "map":
				map_night = _btn.value;
				break;
				
			case "level":
				if (_btn.value <= unlocked_levels) {
					selected_level = _btn.value;
				} else {
					// Nivel bloqueado, sonido de error
					audio_play_sound(snd_ui_close, 0, false);
				}
				break;
				
			case "action":
				if (_btn.value == "back") {
					// Regresar al menú principal: restaurar los botones y destruirse
					instance_create_layer(960, 960, "Instances", obj_button_start);
					instance_create_layer(128, 128, "Instances", obj_button_quit);
					instance_create_layer(128, 320, "Instances", obj_button_audio);
					instance_destroy();
				} 
				else if (_btn.value == "play") {
					// Guardar la configuración en las variables globales
					global.dificultad = selected_difficulty;
					global.mapa_nocturno = map_night;

					// Ir al juego con el nivel seleccionado
					level_start(selected_level);
				}
				break;
		}
	}
}
