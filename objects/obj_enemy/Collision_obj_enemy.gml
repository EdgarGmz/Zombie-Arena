// Vector from other to this (push away direction).
var _dx = x - other.x;
var _dy = y - other.y;

// If they are exactly on the same spot, add a small random offset to separate them.
if (_dx == 0 && _dy == 0)
{
	_dx = choose(-1, 1);
	_dy = choose(-1, 1);
}

// Normalize the separation direction vector and push away by 1 pixel.
var _dist = sqrt(_dx * _dx + _dy * _dy);
x += _dx / _dist;
y += _dy / _dist;