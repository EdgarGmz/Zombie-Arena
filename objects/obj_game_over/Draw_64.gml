// --- FONDO OSCURECIDO (EFECTO DEGRADADO) ---
draw_set_alpha(0.7); 
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // Resetear opacidad

// --- SISTEMA DE RÉCORDS: MOSTRAR TABLA EN LA GUI ---
draw_set_color(c_white);          
draw_set_font(fnt_small);         
draw_set_halign(fa_center);       

// Título de la tabla
draw_text(display_get_gui_width() / 2, 150, "--- TOP SOBREVIVIENTES ---");

// Dibujar la lista del Top 10 de GameMaker de forma limpia
draw_highscore(display_get_gui_width() / 2 - 200, 200, display_get_gui_width() / 2 + 200, 550);

// Resetear alineación
draw_set_halign(fa_left);