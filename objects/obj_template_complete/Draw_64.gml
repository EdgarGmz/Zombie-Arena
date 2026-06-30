// Set color.
// This will be a semi-transparent black.
draw_set_colour(c_black);
draw_set_alpha(0.5);

// Draw rectangle filling the screen.
draw_rectangle(0, 0, 1920, 1080, 0);

// Set color to opaque white.
draw_set_colour(c_white);
draw_set_alpha(1);

// Draw game over banner.
draw_sprite(spr_well_done_banner, 0, x, y);

// Set font.
draw_set_font(fnt_large);

// Align drawn text horizontally and vertically.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw victory text.
var _titulo = "¡BIEN HECHO!";
var _subtitulo = "Has completado la demo del juego.";

if (variable_global_exists("selected_level")) {
	_titulo = "¡NIVEL " + string(global.selected_level) + " COMPLETADO!";
	if (global.selected_level < 5) {
		if (level_can_play(global.selected_level + 1)) {
			_subtitulo = "¡Nivel " + string(global.selected_level + 1) + " desbloqueado! Pulsa SIGUIENTE para continuar.";
		} else {
			_subtitulo = "¡Has desbloqueado el Nivel " + string(global.selected_level + 1) + "!";
		}
	} else {
		_subtitulo = "¡Sobreviviste a la Integradora Final! ¡Felicidades!";
	}
}

draw_text(x, y - 10, _titulo);

// Set font.
draw_set_font(fnt_small_medium);

// Draw subtitulo text.
draw_text(x, y + 35, _subtitulo);

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);