// --- CAPTURAR NOMBRE Y GUARDAR RÉCORD ---
var _id = ds_map_find_value(async_load, "id");

// Si el usuario interactuó con la ventana de diálogo
if (_id == global.msg_nombre)
{
    // Si hizo clic en "Aceptar" u "OK"
    if (ds_map_find_value(async_load, "status"))
    {
        var _nombre_ingresado = ds_map_find_value(async_load, "result");
        
        // Si le dio aceptar sin escribir nada, le asignamos "Sobreviviente"
        if (_nombre_ingresado == "") {
            _nombre_ingresado = "Sobreviviente";
        }
        
        // Añadir a la tabla nativa (Le ponemos un puntaje de prueba de 5000 
        // para asegurar que suba al Top 10 y verifiques que funcione)
        highscore_add(_nombre_ingresado, 5000);
    }
}