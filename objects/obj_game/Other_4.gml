// 1. Buscamos la capa de fondo de la habitación
var _lay_id = layer_get_id("Background");
var _back_id = layer_background_get_id(_lay_id);

// 2. Si la variable es verdadera, ponemos el sprite de noche. Si no, el de día.
if (global.mapa_nocturno == true) 
{
    layer_background_sprite(_back_id, spr_mapa_noche); // Nombre de tu imagen de noche
}
else 
{
    layer_background_sprite(_back_id, spr_mapa_dia); // Nombre de tu imagen de día
}