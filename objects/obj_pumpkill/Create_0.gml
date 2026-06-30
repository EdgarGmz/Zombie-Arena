// Call parent event to set up general eney stuff.
enemy_base_scale = 1.4;
event_inherited();

// Set speed for this enemy type.
speed = 6;

// Set max hitpoints for this enemy type.
hitpoints_max = global.enemy_health_bonus;

// Set hitpoints.
hitpoints = hitpoints_max;

// Set sprites for this enemy type (zombie básico).
walk_sprite = spr_zombie_basico_walk;
attack_sprite = spr_zombie_basico_attack;
hit_sprite = spr_zombie_basico_hit;

enemy_play_walk(false);