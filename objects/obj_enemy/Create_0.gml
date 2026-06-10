// Set base scale to 0.75 (reduced by 25% to fit new background dimensions)
base_scale = 0.75;
image_xscale = base_scale;
image_yscale = base_scale;

// Create variable for max hitpoints.
hitpoints_max = 2 * global.enemy_health_bonus;

// Create variable for hitpoints.
hitpoints = hitpoints_max;

// Set speed.
speed = 4;

// Create variable to show/hide the healthbar.
show_healthbar = 0;

// Create shadow object to follow.
var _shadow = instance_create_layer(x, y, "Shadows", obj_shadow);
// Set shadow owner.
_shadow.owner_object = self;
_shadow.image_xscale = base_scale;
_shadow.image_yscale = base_scale;