// Initialize the shooting weapon data struct.
global.shooting = {
	damage: 0.75,
	attack_speed: 30,
	number_of_shots: 1,
	unlocked: true
};

// Define the function to reset the shooting weapon state.
function weapon_shooting_reset()
{
	global.shooting.damage = 0.75;
	global.shooting.attack_speed = 30;
	global.shooting.number_of_shots = 1;
	global.shooting.unlocked = true;
}

// Define function to retrieve list of available shooting weapon upgrades.
function weapon_shooting_upgrades(_upgrade_list)
{
	var _unlocked = global.shooting.unlocked;

	if (!_unlocked)
	{
		var _struct = {
			description: "Unlock Shooting\nWeapon",
			title: "UNLOCK",
			object: global.shooting,
			key: "unlocked",
			amount: 1,
			icon: spr_shooting_attack_big,
			weapon_name: "PROJECTILE"
		};

		array_push(_upgrade_list, _struct);
		exit;
	}

	var _attack_speed = global.shooting.attack_speed;

	if (_attack_speed > 5)
	{
		var _struct = {
			description: "Increase Attack Speed",
			title: "SPEED",
			object: global.shooting,
			key: "attack_speed",
			amount: -5,
			icon: spr_shooting_attack_big,
			weapon_name: "PROJECTILE"
		};

		array_push(_upgrade_list, _struct);
	}

	var _number_of_shots = global.shooting.number_of_shots;

	if (_number_of_shots < 7)
	{
		var _struct = {
			description: "Number of shots +2",
			title: "BARRAGE",
			object: global.shooting,
			key: "number_of_shots",
			amount: 2,
			icon: spr_shooting_attack_big,
			weapon_name: "PROJECTILE"
		};

		array_push(_upgrade_list, _struct);
	}

	var _damage = global.shooting.damage;

	if (_damage < 4)
	{
		var _struct = {
			description: "Increase Damage",
			title: "DAMAGE",
			object: global.shooting,
			key: "damage",
			amount: 0.4,
			icon: spr_shooting_attack_big,
			weapon_name: "PROJECTILE"
		};

		array_push(_upgrade_list, _struct);
	}
}