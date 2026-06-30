// Inicializar variables de configuración
selected_level = 1;
unlocked_levels = level_load_unlocked();
selected_difficulty = 1; // 0: Fácil, 1: Normal, 2: Pesadilla
map_night = false;      // false: Día, true: Noche

// Dimensiones de pantalla
gui_w = 1920;
gui_h = 1080;

// Estructura de botones interactivos para detección en Step y Draw
// Cada botón tiene: x, y, w, h, etiqueta, valor_asociado, tipo
buttons = [];

// Helper para agregar botones
function add_button(_x, _y, _w, _h, _label, _value, _type) {
	array_push(buttons, {
		bx: _x,
		by: _y,
		bw: _w,
		bh: _h,
		label: _label,
		value: _value,
		type: _type,
		hover: false,
		clicked: false
	});
}

// 1. Dificultades
add_button(660, 320, 200, 60, "FACIL", 0, "difficulty");
add_button(960, 320, 200, 60, "NORMAL", 1, "difficulty");
add_button(1260, 320, 200, 60, "PESADILLA", 2, "difficulty");

// 2. Mapa (Día/Noche)
add_button(810, 500, 220, 60, "DIA", false, "map");
add_button(1110, 500, 220, 60, "NOCHE", true, "map");

// 3. Niveles (1 al 5)
add_button(600, 690, 100, 100, "1", 1, "level");
add_button(780, 690, 100, 100, "2", 2, "level");
add_button(960, 690, 100, 100, "3", 3, "level");
add_button(1140, 690, 100, 100, "4", 4, "level");
add_button(1320, 690, 100, 100, "5", 5, "level");

// 4. Acción (Jugar / Volver)
add_button(960, 890, 300, 80, "¡SOBREVIVIR!", "play", "action");
add_button(150, 90, 180, 60, "VOLVER", "back", "action");
