var mx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var my = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (mx != 0 || my != 0) {
    var len = point_distance(0, 0, mx, my);
    x += (mx / len) * spd;
    y += (my / len) * spd;
}

x = clamp(x, 20, room_width - 20);
y = clamp(y, 20, room_height - 20);
