// Cambia la variable de falso a verdadero o viceversa
global.mapa_nocturno = !global.mapa_nocturno;

// Cambia la imagen del botón (0 para sol, 1 para luna)
image_index = global.mapa_nocturno ? 1 : 0;

// Sonido de clic
audio_play_sound(snd_click, 1, false);