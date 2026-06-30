// Call parent event to set up general enemy stuff.
enemy_base_scale = 1.65;
event_inherited();

// Set speed for this enemy type.
speed = 1.5;

// Set max hitpoints for this enemy type.
hitpoints_max = 12 * global.enemy_health_bonus;
hitpoints = hitpoints_max;

// Set sprites for this enemy type (jefe zombie).
walk_sprite = spr_zombie_boss_walk;
attack_sprite = spr_zombie_boss_attack;
hit_sprite = spr_zombie_boss_hit;

enemy_play_walk(false);
