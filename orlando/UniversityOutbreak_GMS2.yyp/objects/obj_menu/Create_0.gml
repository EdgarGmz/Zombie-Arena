menu_option = 0;

options = ["JUGAR", "OPCIONES", "CREDITOS", "SALIR"];

button_x = room_width / 2;
button_y = 520;
button_w = 420;
button_h = 72;
button_gap = 95;

title_text = "UNIVERSITY OUTBREAK";

function ejecutar_opcion()
{
    switch(menu_option)
    {
        case 0:
            room_goto(rm_juego);
        break;

        case 1:
            show_message("Opciones proximamente");
        break;

        case 2:
            show_message("Juego creado por Orlando - Proyecto 2D zombie universitario");
        break;

        case 3:
            game_end();
        break;
    }
}
