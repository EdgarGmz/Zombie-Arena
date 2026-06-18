// If an instance of obj_upgrade exists then
// that means we are on the upgrade screen...
if (instance_exists(obj_game_over))
{
	// Exit event, so we don't render the HUD.
	exit;
}

// If the upgrade screen is open...
if (instance_exists(obj_upgrade))
{
	// Exit event, so we don't render the HUD.
	exit;
}

// Draw the shooting weapon icon, using the "unlocked"
// property of the shooting weapon.
draw_sprite(spr_shooting_attack_small, global.shooting[? "unlocked"], 40, 20);

// Draw the trail weapon icon, using the "unlocked"
// property of the trail weapon.
draw_sprite(spr_trail_attack_small, global.trail[? "unlocked"], 40 + 120, 20);

// Draw the swipe weapon icon, using the "unlocked"
// property of the swipe weapon.
draw_sprite(spr_arcing_attack_small, global.swipe[? "unlocked"], 40 + 240, 20);

// Draw the back of the experience bar.
/*draw_sprite_ext(spr_xpbar_back, 0, 400, 30, 1120 / 65, 1, 0, c_white, 1);

// Get how much the bar should be filled.
var _fill = min(global.xp / global.xp_goal, 1);

// Draw the experince bar filling.
draw_sprite_ext(spr_xpbar_fill, 0, 407, 37, (1172 / 54) * _fill, 1, 0, c_white, 1);
*/

// --- INTERFAZ COMPARTIDA: MITAD SANGRE Y MITAD EXPERIENCIA ---

// 1. Dibujar el fondo gris completo original (Mide 1120 píxeles de ancho)
draw_sprite_ext(spr_xpbar_back, 0, 400, 30, 1120 / 65, 1, 0, c_white, 1);

// ==========================================
// MITAD IZQUIERDA: BARRA DE SANGRE (VIDA)
// ==========================================
// Conseguimos el porcentaje de vida del héroe usando sus variables reales
var _fill_sangre = min(obj_hero.hitpoints / obj_hero.hitpoints_max, 1);

// Dibujamos el relleno desde la posición X: 407 hasta la mitad.
// El ancho máximo ahora es la mitad del total (~575 en la escala del sprite).
draw_sprite_ext(spr_xpbar_fill, 0, 407, 37, (575 / 54) * _fill_sangre, 1, 0, c_red, 1);


// ==========================================
// MITAD DERECHA: BARRA DE EXPERIENCIA (XP)
// ==========================================
// Conseguimos el porcentaje de la experiencia actual
var _fill_xp = min(global.xp / global.xp_goal, 1);

// Dibujamos el relleno de XP (en c_white o c_blue como la tenías originalmente)
// pero la recorremos en el eje X para que empiece justo en la mitad (407 + 575 = 982)
draw_sprite_ext(spr_xpbar_fill, 0, 982, 37, (575 / 54) * _fill_xp, 1, 0, c_white, 1);

// Set the font.
draw_set_font(fnt_small);

// Center the text vertically and horizontally.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw our current level.
draw_text(1450, 65, "LV: " + string(global.level));

// Reset text alignments
draw_set_halign(fa_left);
draw_set_valign(fa_top);