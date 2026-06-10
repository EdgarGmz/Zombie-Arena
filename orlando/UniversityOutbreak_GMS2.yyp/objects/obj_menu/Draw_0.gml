// Fondo dibujado sin sprites para evitar errores de importacion
draw_clear(make_color_rgb(8, 8, 10));

// Cielo oscuro
draw_set_color(make_color_rgb(12, 15, 22));
draw_rectangle(0, 0, room_width, room_height, false);

// Luna roja
draw_set_color(make_color_rgb(120, 20, 20));
draw_circle(room_width - 240, 150, 90, false);

// Edificios de universidad en ruinas
draw_set_color(make_color_rgb(28, 28, 32));
draw_rectangle(120, 370, 520, 860, false);
draw_rectangle(620, 320, 1180, 860, false);
draw_rectangle(1280, 400, 1780, 860, false);

// Ventanas
for (var xx = 160; xx < 500; xx += 70) {
    for (var yy = 420; yy < 800; yy += 70) {
        draw_set_color(make_color_rgb(45, 35, 18));
        draw_rectangle(xx, yy, xx + 30, yy + 38, false);
    }
}

for (var xx2 = 670; xx2 < 1140; xx2 += 80) {
    for (var yy2 = 380; yy2 < 800; yy2 += 70) {
        draw_set_color(make_color_rgb(50, 38, 20));
        draw_rectangle(xx2, yy2, xx2 + 34, yy2 + 40, false);
    }
}

// Suelo
draw_set_color(make_color_rgb(18, 18, 18));
draw_rectangle(0, 860, room_width, room_height, false);

// Titulo
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(room_width / 2, 160, title_text, 3.2, 3.2, 0);

draw_set_color(c_red);
draw_text_transformed(room_width / 2 + 4, 165, "ZOMBIE UNIVERSITY", 2.1, 2.1, 0);

// Botones
for (var i = 0; i < array_length(options); i++) {
    var yy3 = button_y + (i * button_gap);

    if (i == menu_option) {
        draw_set_color(make_color_rgb(130, 0, 0));
        draw_rectangle(button_x - button_w/2, yy3, button_x + button_w/2, yy3 + button_h, false);
        draw_set_color(c_white);
    } else {
        draw_set_color(make_color_rgb(22, 22, 22));
        draw_rectangle(button_x - button_w/2, yy3, button_x + button_w/2, yy3 + button_h, false);
        draw_set_color(c_gray);
    }

    draw_text_transformed(button_x, yy3 + button_h/2, options[i], 1.4, 1.4, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_ltgray);
draw_text(25, room_height - 45, "Usa W/S o flechas. Enter o clic para seleccionar.");
