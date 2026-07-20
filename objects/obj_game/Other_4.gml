// 1. Buscamos la capa de fondo de la habitación
var _lay_id = layer_get_id("Background");
var _back_id = layer_background_get_id(_lay_id);

// 2. Si la variable es verdadera, ponemos el sprite de noche. Si no, el de día.
if (global.mapa_nocturno == true) 
{
    layer_background_sprite(_back_id, spr_mapa_noche); // Imagen de noche
    layer_background_stretch(_back_id, true);          // Estirar para que ocupe todo el mapa (mismo tamaño que colisiones del mapa de día)
    layer_background_htiled(_back_id, false);          // Desactivar repetición horizontal
    layer_background_vtiled(_back_id, false);          // Desactivar repetición vertical
}
else 
{
    layer_background_sprite(_back_id, spr_mapa_dia);   // Imagen de día
    layer_background_stretch(_back_id, false);         // El mapa de día ya es 3840x2160, no necesita estirarse
    layer_background_htiled(_back_id, false);          // Desactivar repetición horizontal
    layer_background_vtiled(_back_id, false);          // Desactivar repetición vertical
}