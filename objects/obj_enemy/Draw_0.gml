// Draw the shadow sprite first.
draw_sprite_ext(spr_shadow, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.5);

// Draw the enemy sprite.
draw_self();
