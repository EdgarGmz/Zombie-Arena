// Draw self (the small button base)
draw_self();

// Draw the autoshoot toggle icon in the center of the button.
var _icon_frame = global.auto_shoot ? 1 : 0;
draw_sprite_ext(spr_boton_autoshoot, _icon_frame, x - 32 * image_xscale, y - 32 * image_yscale, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Set font and color for the label
draw_set_font(fnt_medium);
draw_set_colour(c_white);

// --- MODIFICACIÓN AQUÍ ---
// Si existe el menú de preparar examen (obj_level_select) O estás en el menú principal (x < 400)
if (x < 400 || instance_exists(obj_level_select))
{
	// Menú Principal o Selección de Nivel: Texto a la derecha
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(x + 100 * image_xscale, y, "AUTO SHOOT: " + (global.auto_shoot ? "ON" : "OFF"), image_xscale, image_yscale, image_angle);
}
else
{
	// Pantalla de Pausa: Texto arriba del botón
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(x, y - 90 * image_yscale, "AUTO SHOOT: " + (global.auto_shoot ? "ON" : "OFF"), image_xscale, image_yscale, image_angle);
}

// Reset text alignments and color to default
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);