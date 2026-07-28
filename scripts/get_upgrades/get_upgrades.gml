// Declare a function that retrieves all possible upgrades
// and creates upgrade card objects for 3 of them.
function get_upgrades()
{
	// Destroy any existing upgrade cards.
	with(obj_upgrade)
	{
		instance_destroy();
	}

	// Create a new array to hold possible upgrades.
	var _upgrade_list = [];

	// Get upgrades for the shooting weapon and place them in the list.
	weapon_shooting_upgrades(_upgrade_list);

	// Get upgrades for the swipe weapon and place them in the list.
	weapon_swipe_upgrades(_upgrade_list);

	// Get upgrades for the trail weapon and place them in the list.
	weapon_trail_upgrades(_upgrade_list);

	// Shuffle the array containing all the retrieved upgrades in-place.
	array_shuffle_ext(_upgrade_list);

	// Get the size of the array, this is how many upgrades are in it.
	var _size = array_length(_upgrade_list);

	// Define the x position where the first upgrade card will be created.
	var _x = -400;

	// For each upgrade in the list, up to a max of 3...
	for (var _index = 0; _index < min(_size, 3); _index += 1)
	{
		// Get the upgrade at the current index.
		var _upgrade_data = _upgrade_list[_index];

		// Create a new upgrade card object.
		var _upgrade = instance_create_layer(1920 / 2 + _x, 1080 / 2, "UpgradeScreen", obj_upgrade);

		// Set the reveal covering life.
		_upgrade.roll_life = 0.5 + 0.25 * _index;

		// Set the upgrade data to the upgrade card object.
		_upgrade.upgrade_data = _upgrade_data;

		// Increment the x position for the next card.
		_x += 400;
	}
}