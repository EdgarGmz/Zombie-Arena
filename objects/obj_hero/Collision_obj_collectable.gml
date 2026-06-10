// Comprobar el tipo de recolectable recogido
var _type = other.collectable_type;

if (_type == "xp")
{
	// Incrementar experiencia
	global.xp += 1;
	
	// Elegir un efecto de sonido aleatorio de recolección de XP
	var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);
	audio_play_sound(_sound, 0, false);
}
else
{
	// Es un material de crafteo escolar
	if (_type == "regla") inventory.reglas += 1;
	else if (_type == "lapiz") inventory.lapices += 1;
	else if (_type == "tijera") inventory.tijeras += 1;
	else if (_type == "grapa") inventory.grapas += 1;
	else if (_type == "cafe") inventory.cafe += 1;
	
	// Sonido de recolección escolar
	var _sound = choose(snd_pickup_1, snd_pickup_2, snd_pickup_3);
	audio_play_sound(_sound, 0, false);
	
	// Crear un popup de texto flotante en español mostrando qué recogió
	var _texto = "+" + string_upper(_type);
	var _popup = instance_create_layer(x, y - 50, "Instances", obj_text_popup);
	_popup.text = _texto;
}

// Destruir la instancia del recolectable
with(other)
{
	instance_destroy();
}