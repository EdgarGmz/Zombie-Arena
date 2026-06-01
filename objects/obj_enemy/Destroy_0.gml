// Otorgar experiencia de forma automática al derrotar al enemigo
global.xp += 1;

// Decide qué drop usar
var _drop = obj_collectable;

// 1/10 de probabilidad de soltar un corazón de curación en su lugar
if (irandom(9) == 0)
{
	_drop = obj_heart;
}

// Crear el drop
var _inst = instance_create_layer(x, y, "Instances", _drop);

// Si el drop es de chatarra escolar (y no un corazón), asignar el tipo según el enemigo
if (_drop == obj_collectable)
{
	var _type = "regla"; // Por defecto
	
	if (object_index == obj_pumpkill)
	{
		// Estudiante Zombie: Regla (100% de probabilidad) o Lápiz (50%)
		_type = choose("regla", "regla", "lapiz");
	}
	else if (object_index == obj_pigun)
	{
		// Profesor Zombie: Lápiz
		_type = "lapiz";
	}
	else if (object_index == obj_rooster)
	{
		// Personal Administrativo Zombie: Tijera
		_type = "tijera";
	}
	
	_inst.collectable_type = _type;
}