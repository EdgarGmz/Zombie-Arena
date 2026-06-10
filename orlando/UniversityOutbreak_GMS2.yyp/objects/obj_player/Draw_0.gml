draw_set_color(c_lime);
draw_circle(x, y, 18, false);
draw_set_color(c_white);
draw_text(x - 22, y - 45, "PLAYER");
draw_set_color(c_red);
draw_rectangle(20, 20, 220, 42, false);
draw_set_color(c_lime);
draw_rectangle(20, 20, 20 + vida * 2, 42, false);
