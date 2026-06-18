// Stop all audio.
audio_stop_all();

// Play the lose game jingle.
audio_play_sound(snd_lose, 0, false);

// --- CORRECCIÓN DE BOTONES (COORDENADAS FIJAS EN LA PANTALLA) ---
// En lugar de usar 'x', usamos el centro real de la pantalla (1920 / 2 = 960)
// para que los botones siempre aparezcan exactamente en el mismo lugar abajo.
instance_create_layer(960 - 180, 1080 - 330, "Buttons", obj_button_exit);
instance_create_layer(960 + 180, 1080 - 330, "Buttons", obj_button_retry);

// Guardar la oleada alcanzada en el leaderboard local (archivo JSON).
//leaderboard_save(global.level);

// Cargar el leaderboard para mostrarlo en la pantalla de Game Over.
//lb_puntuaciones = leaderboard_load();

// 1. Destruir cualquier carta de mejora que haya quedado en pantalla
if (instance_exists(obj_upgrade)) {
    instance_destroy(obj_upgrade);
}

// 2. Pedir el nombre al jugador (Asegúrate de que esta línea se ejecute)
global.msg_nombre = get_string_async("¡Sobreviviste lo que pudiste! Introduce tu nombre:", "Sobreviviente");

// 3. SOLUCIÓN AL CRASH: Como 'global.score' no existe, usamos la variable nativa de puntos de GameMaker: 'score'.
// Tu compañero seguro usó la variable interna del motor o un número fijo para las pruebas.
global.puntos_finales = score;