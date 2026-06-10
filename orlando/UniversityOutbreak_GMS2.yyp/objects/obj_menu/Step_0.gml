if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    menu_option++;
    if (menu_option >= array_length(options)) menu_option = 0;
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    menu_option--;
    if (menu_option < 0) menu_option = array_length(options) - 1;
}

for (var i = 0; i < array_length(options); i++) {
    var bx1 = button_x - button_w / 2;
    var by1 = button_y + (i * button_gap);
    var bx2 = bx1 + button_w;
    var by2 = by1 + button_h;

    if (point_in_rectangle(mouse_x, mouse_y, bx1, by1, bx2, by2)) {
        menu_option = i;
        if (mouse_check_button_pressed(mb_left)) ejecutar_opcion();
    }
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    ejecutar_opcion();
}
