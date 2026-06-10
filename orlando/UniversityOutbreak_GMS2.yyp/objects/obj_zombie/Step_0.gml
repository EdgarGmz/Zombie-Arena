if (instance_exists(obj_player)) {
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);

    if (point_distance(x, y, obj_player.x, obj_player.y) < 28) {
        obj_player.vida = max(0, obj_player.vida - 0.2);
    }
}
