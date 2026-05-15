// Set color.
// This will be a semi-transparent black.
draw_set_colour(c_black);
draw_set_alpha(0.6);

// Draw rectangle filling the screen.
draw_rectangle(0, 0, 1920, 1080, 0);

// Reset color to opaque white.
draw_set_colour(c_white);
draw_set_alpha(1);

// Draw game over banner.
draw_sprite(spr_game_over_banner, 0, 1920 / 2, 1080 / 2);

// Set font.
draw_set_font(fnt_large);

// Align drawn text horizontally and vertically.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw game over text.
draw_text(1920 / 2, 1080 / 2, "GAME OVER");

// --- Oleada alcanzada ---
draw_set_font(fnt_medium);
draw_text(1920 / 2, 1080 / 2 + 100, "Oleada alcanzada: " + string(global.level));

// --- Top 10 Leaderboard ---
draw_set_font(fnt_small_medium);
draw_text(1920 / 2, 1080 / 2 + 150, "─── MEJORES OLEADAS ───");

var _total = array_length(lb_puntuaciones);
for (var _i = 0; _i < min(_total, 10); _i++) {
	var _entrada = lb_puntuaciones[_i];
	var _linea   = string(_i + 1) + ".  Oleada " + string(_entrada.oleada) + "     " + _entrada.fecha;
	draw_text(1920 / 2, 1080 / 2 + 185 + _i * 28, _linea);
}

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);