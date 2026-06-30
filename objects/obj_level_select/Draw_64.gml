// 1. Dibujar fondo oscuro semitransparente sobre todo el menú anterior
draw_set_alpha(0.9);
draw_set_color(make_color_rgb(15, 18, 24)); // Fondo premium oscuro
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1.0);

// Dibujar un borde elegante en la pantalla
draw_set_color(make_color_rgb(46, 204, 113)); // Verde menta
draw_rectangle(30, 30, gui_w - 30, gui_h - 30, true);

// 2. Título Principal
draw_set_font(fnt_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(gui_w / 2, 120, "PREPARAR EXAMEN - COLISEO UTSC");

// Subtítulo
draw_set_font(fnt_small_medium);
draw_set_color(c_gray);
draw_text(gui_w / 2, 175, "Selecciona tu misión, dificultad y horario antes de ingresar al patio");

// 3. Encabezados de Sección
draw_set_font(fnt_medium);
draw_set_color(c_white);
draw_text(gui_w / 2, 260, "--- DIFICULTAD ---");
draw_text(gui_w / 2, 430, "--- HORARIO (MAPA) ---");
draw_text(gui_w / 2, 600, "--- NIVELES DE RESISTENCIA ---");

// 4. Dibujar Botones
var _n = array_length(buttons);
for (var _i = 0; _i < _n; _i++) {
	var _btn = buttons[_i];
	
	// Determinar el estado del botón para elegir colores
	var _selected = false;
	var _locked = false;
	
	if (_btn.type == "difficulty") {
		_selected = (selected_difficulty == _btn.value);
	}
	else if (_btn.type == "map") {
		_selected = (map_night == _btn.value);
	}
	else if (_btn.type == "level") {
		_selected = (selected_level == _btn.value);
		_locked = (_btn.value > unlocked_levels);
	}
	
	// Colores del botón
	var _bg_color = make_color_rgb(30, 35, 45); // Color base
	var _border_color = make_color_rgb(80, 90, 100);
	var _text_color = c_gray;
	
	if (_locked) {
		_bg_color = make_color_rgb(25, 20, 20);
		_border_color = make_color_rgb(80, 40, 40);
		_text_color = make_color_rgb(120, 60, 60);
	}
	else if (_selected) {
		_bg_color = make_color_rgb(46, 204, 113); // Verde UTSC
		_border_color = c_white;
		_text_color = c_black;
	}
	else if (_btn.hover) {
		_bg_color = make_color_rgb(50, 60, 75);
		_border_color = make_color_rgb(200, 200, 200);
		_text_color = c_white;
	}
	else {
		_text_color = c_white;
	}
	
	// Dibujar Rectángulo del botón (coordenadas centradas)
	draw_set_color(_bg_color);
	draw_rectangle(_btn.bx - _btn.bw / 2, _btn.by - _btn.bh / 2, _btn.bx + _btn.bw / 2, _btn.by + _btn.bh / 2, false);
	
	draw_set_color(_border_color);
	draw_rectangle(_btn.bx - _btn.bw / 2, _btn.by - _btn.bh / 2, _btn.bx + _btn.bw / 2, _btn.by + _btn.bh / 2, true);
	
	// Dibujar Texto del botón
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(_text_color);
	
	if (_btn.type == "action" && _btn.value == "play") {
		draw_set_font(fnt_medium);
	} else {
		draw_set_font(fnt_small_medium);
	}
	
	var _label_to_draw = _btn.label;
	if (_locked) {
		_label_to_draw = "BLOQ.";
	}
	draw_text(_btn.bx, _btn.by, _label_to_draw);
}

// 5. Dibujar Descripción del Nivel Seleccionado
var _desc = "";
switch (selected_level) {
	case 1: _desc = "Nivel 1: Examen Parcial I (Sobrevive hasta Ola 2). Zombis lentos y relajados."; break;
	case 2: _desc = "Nivel 2: Examen Parcial II (Sobrevive hasta Ola 4). Los Profesores empiezan a merodear."; break;
	case 3: _desc = "Nivel 3: Examen Parcial III (Sobrevive hasta Ola 6). La horda administrativa ataca."; break;
	case 4: _desc = "Nivel 4: Entregas Finales (Sobrevive hasta Ola 8). Mayor velocidad y agresividad."; break;
	case 5: _desc = "Nivel 5: ¡INTEGRADORA FINAL! (Sobrevive hasta Ola 10). Boss letal al final."; break;
}
draw_set_font(fnt_small_medium);
draw_set_color(make_color_rgb(241, 196, 15)); // Amarillo oro
draw_set_halign(fa_center);
draw_text(gui_w / 2, 790, _desc);

// 6. Dibujar info de Dificultad activa
var _diff_desc = "";
switch (selected_difficulty) {
	case 0: _diff_desc = "Fácil: Enemigos con -30% vida y spawn más lento."; break;
	case 1: _diff_desc = "Normal: Experiencia estándar de supervivencia."; break;
	case 2: _diff_desc = "Pesadilla: Enemigos con +40% vida y spawn acelerado."; break;
}
draw_set_font(fnt_small);
draw_set_color(c_gray);
draw_text(gui_w / 2, 825, _diff_desc);

// Resetear alineación y color
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
