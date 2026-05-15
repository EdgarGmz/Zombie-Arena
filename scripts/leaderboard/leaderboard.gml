/// @function leaderboard_load()
/// @description Carga el Top 10 desde el archivo leaderboard.json en el directorio de trabajo.
/// @returns {Array<Struct>} Array de structs con los campos {oleada, fecha}.
function leaderboard_load() {
	var _ruta = working_directory + "leaderboard.json";
	var _puntuaciones = [];

	// Si el archivo existe, leerlo y parsearlo.
	if (file_exists(_ruta)) {
		var _archivo = file_text_open_read(_ruta);
		var _json    = file_text_read_string(_archivo);
		file_text_close(_archivo);

		// Solo parsear si el contenido no está vacío.
		if (_json != "") {
			_puntuaciones = json_parse(_json);
		}
	}

	return _puntuaciones;
}

/// @function leaderboard_save(oleada)
/// @description Agrega una nueva entrada, ordena y conserva solo el Top 10. Guarda en JSON.
/// @param {real} oleada - La oleada alcanzada antes de morir.
function leaderboard_save(oleada) {
	var _puntuaciones = leaderboard_load();

	// Construir la nueva entrada con oleada y fecha actual.
	var _entrada = {
		oleada : oleada,
		fecha  : string(current_day) + "/" + string(current_month) + "/" + string(current_year),
	};
	array_push(_puntuaciones, _entrada);

	// Ordenar de mayor a menor oleada con Bubble Sort.
	var _n = array_length(_puntuaciones);
	for (var _i = 0; _i < _n - 1; _i++) {
		for (var _j = 0; _j < _n - 1 - _i; _j++) {
			if (_puntuaciones[_j].oleada < _puntuaciones[_j + 1].oleada) {
				var _temp            = _puntuaciones[_j];
				_puntuaciones[_j]     = _puntuaciones[_j + 1];
				_puntuaciones[_j + 1] = _temp;
			}
		}
	}

	// Recortar a los 10 mejores puntajes.
	if (array_length(_puntuaciones) > 10) {
		array_resize(_puntuaciones, 10);
	}

	// Serializar y escribir al archivo JSON.
	var _ruta    = working_directory + "leaderboard.json";
	var _archivo = file_text_open_write(_ruta);
	file_text_write_string(_archivo, json_stringify(_puntuaciones));
	file_text_close(_archivo);
}
