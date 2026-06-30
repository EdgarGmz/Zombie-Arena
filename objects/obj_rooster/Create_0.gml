// Call parent event to set up general enemy stuff.
enemy_base_scale = 0.55;
event_inherited();

// Set speed for this enemy type.
speed = 2;

// Set sprites for this enemy type (zombie tanque).
walk_sprite = spr_zombie_tank_walk;
attack_sprite = spr_zombie_tank_attack;
hit_sprite = spr_zombie_tank_hit;

enemy_play_walk(false);