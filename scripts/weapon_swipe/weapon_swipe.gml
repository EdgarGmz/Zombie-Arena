// Initialize the swipe weapon data struct.
global.swipe = {
	damage: 1,
	attack_speed: 60,
	unlocked: false
};

// Define the reset function for the swipe weapon.
function weapon_swipe_reset()
{
	global.swipe.damage = 1;
	global.swipe.attack_speed = 60;
	global.swipe.unlocked = false;
}

// Declare a function to get the swipe weapon upgrades.
function weapon_swipe_upgrades(_upgrade_list)
{
	var _unlocked = global.swipe.unlocked;

	if (!_unlocked)
	{
		var _struct = {
			description: "Small but fast\narea of effect\nattack around\nthe player",
			title: "UNLOCK",
			object: global.swipe,
			key: "unlocked",
			amount: 1,
			icon: spr_arcing_attack_big,
			weapon_name: "SWIPE"
		};

		array_push(_upgrade_list, _struct);
		exit;
	}

	var _attack_speed = global.swipe.attack_speed;

	if (_attack_speed > 10)
	{
		var _struct = {
			description: "Increase Attack Speed",
			title: "SPEED",
			object: global.swipe,
			key: "attack_speed",
			amount: -10,
			icon: spr_arcing_attack_big,
			weapon_name: "SWIPE"
		};

		array_push(_upgrade_list, _struct);
	}

	var _damage = global.swipe.damage;

	if (_damage < 5)
	{
		var _struct = {
			description: "Increase Damage",
			title: "DAMAGE",
			object: global.swipe,
			key: "damage",
			amount: 1,
			icon: spr_arcing_attack_big,
			weapon_name: "SWIPE"
		};

		array_push(_upgrade_list, _struct);
	}
}