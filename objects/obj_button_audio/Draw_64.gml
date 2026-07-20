// Set frame based on current volume.
image_index = audio_get_master_gain(0) > 0;

// Draw self, this is the button sprite.
draw_self();

// Draw the little speaker icon.
draw_sprite_ext(spr_sound_button, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// --- AÑADIMOS EL TEXTO DINÁMICO ---
draw_set_font(fnt_medium);
draw_set_colour(c_white);

if (x < 400 || instance_exists(obj_level_select))
{
	// Menús: Dibujar texto a la derecha
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
    
	var _audio_status = (audio_get_master_gain(0) > 0) ? "ON" : "OFF";
	draw_text_transformed(x + 100 * image_xscale, y, "AUDIO: " + _audio_status, image_xscale, image_yscale, image_angle);
}

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);