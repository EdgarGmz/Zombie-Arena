// Call parent event to set up general enemy stuff.
enemy_base_scale = 0.55;
event_inherited();

// Set max hitpoints specifically for this enemy type.
hitpoints_max = 3 * global.enemy_health_bonus;

// Set hitpoints specifically for this enemy type.
hitpoints = hitpoints_max;

// Set sprites for this enemy type (zombie corredor).
walk_sprite = spr_zombie_runner_walk;
attack_sprite = spr_zombie_runner_attack;
hit_sprite = spr_zombie_runner_hit;

enemy_play_walk(false);