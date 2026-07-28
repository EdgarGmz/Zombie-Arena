// Initialize the trail weapon data struct.
global.trail = {
	damage: 1,
	attack_speed: 90,
	unlocked: false
};

// Define the reset function for the trail weapon.
function weapon_trail_reset()
{
	global.trail.damage = 1;
	global.trail.attack_speed = 90;
	global.trail.unlocked = false;
}

// Define function to retrieve upgrades for the trail weapon.
function weapon_trail_upgrades(_upgrade_list)
{
	var _unlocked = global.trail.unlocked;

	if (!_unlocked)
	{
		var _struct = {
			description: "Large but slow\narea of effect\nattack around\nthe player",
			title: "UNLOCK",
			object: global.trail,
			key: "unlocked",
			amount: 1,
			icon: spr_trail_attack_big,
			weapon_name: "TRAIL"
		};

		array_push(_upgrade_list, _struct);
		exit;
	}

	var _attack_speed = global.trail.attack_speed;

	if (_attack_speed > 30)
	{
		var _struct = {
			description: "Increase Attack Speed",
			title: "SPEED",
			object: global.trail,
			key: "attack_speed",
			amount: -15,
			icon: spr_trail_attack_big,
			weapon_name: "TRAIL"
		};

		array_push(_upgrade_list, _struct);
	}

	var _damage = global.trail.damage;

	if (_damage < 5)
	{
		var _struct = {
			description: "Increase Damage",
			title: "DAMAGE",
			object: global.trail,
			key: "damage",
			amount: 1,
			icon: spr_trail_attack_big,
			weapon_name: "TRAIL"
		};

		array_push(_upgrade_list, _struct);
	}
}