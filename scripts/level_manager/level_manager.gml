/// @function level_load_unlocked()
/// @description Carga el número máximo de niveles desbloqueados (1-5) desde un archivo JSON.
/// @returns {real} Nivel máximo desbloqueado (1 a 5).
function level_load_unlocked() {
	var _ruta = working_directory + "unlocked_levels.json";
	var _max_unlocked = 1;

	if (file_exists(_ruta)) {
		var _archivo = file_text_open_read(_ruta);
		var _json    = file_text_read_string(_archivo);
		file_text_close(_archivo);

		if (_json != "") {
			var _struct = json_parse(_json);
			if (struct_exists(_struct, "max_unlocked")) {
				_max_unlocked = _struct.max_unlocked;
			}
		}
	}

	return clamp(_max_unlocked, 1, 5);
}

/// @function level_start(selected_level)
/// @description Configura el nivel seleccionado y arranca la partida en rm_game.
/// @param {real} selected_level Nivel de resistencia a jugar (1-5).
function level_start(_selected_level) {
	global.selected_level = clamp(_selected_level, 1, 5);
	global.win_wave = global.selected_level * 2;

	if (room == rm_game) {
		room_restart();
	} else {
		room_goto(rm_game);
	}
}

/// @function level_can_play(selected_level)
/// @description Indica si un nivel está desbloqueado y se puede jugar.
/// @param {real} selected_level
/// @returns {bool}
function level_can_play(_selected_level) {
	return _selected_level <= level_load_unlocked();
}

/// @function level_save_unlocked(nivel)
/// @description Guarda el nivel máximo desbloqueado en un archivo JSON.
/// @param {real} nivel - El nivel que se ha desbloqueado.
function level_save_unlocked(nivel) {
	var _ruta = working_directory + "unlocked_levels.json";
	var _struct = {
		max_unlocked: clamp(nivel, 1, 5)
	};

	var _archivo = file_text_open_write(_ruta);
	file_text_write_string(_archivo, json_stringify(_struct));
	file_text_close(_archivo);
}
