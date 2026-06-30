// Call parent event to set up general enemy stuff.
enemy_base_scale = 0.55;
event_inherited();

// Set speed for this enemy type.
speed = 5;

// Set max hitpoints for this enemy type.
hitpoints_max = 4 * global.enemy_health_bonus;
hitpoints = hitpoints_max;

// Set sprites for this enemy type (zombie tóxico).
walk_sprite = spr_zombie_toxic_walk;
attack_sprite = spr_zombie_toxic_attack;
hit_sprite = spr_zombie_toxic_hit;

enemy_play_walk(false);
