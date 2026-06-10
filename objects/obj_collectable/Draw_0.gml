// Checks if the game is paused.
if(!global.paused)
{
	// Add to the timer to make the float effect
	float_timer += delta_time * 0.000001 * 10;
}

// Determinar el color de mezcla basado en el tipo de material escolar
var _colour = c_white;
switch (collectable_type)
{
	case "regla":
		_colour = make_color_rgb(46, 204, 113); // Verde esmeralda premium
		break;
	case "lapiz":
		_colour = make_color_rgb(241, 196, 15);  // Amarillo sol
		break;
	case "tijera":
		_colour = make_color_rgb(52, 152, 219);  // Azul brillante
		break;
	case "grapa":
		_colour = make_color_rgb(149, 165, 166); // Gris plateado/acero
		break;
	case "cafe":
		_colour = make_color_rgb(211, 84, 0);    // Naranja oscuro/café
		break;
}

// Draw the sprite at the appropriate height with color blending
draw_sprite_ext(sprite_index, 0, x, y + sin(float_timer) * 10, 1, 1, 0, _colour, 1);