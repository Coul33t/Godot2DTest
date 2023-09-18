extends Node

var _constants := preload("res://library/Constants.gd").new()
var _types := preload("res://library/Types.gd").new()
 
func vector_to_array(vector_coord: Vector2) -> Array:
	var x: int = ((vector_coord.x - _constants.START_X) / _constants.STEP_X) as int
	var y: int = ((vector_coord.y - _constants.START_Y) / _constants.STEP_Y) as int

	return [x, y]
	
func index_to_vector(x: int, y: int, x_offset: int = 0, y_offset: int = 0) -> Vector2:
	var x_vector: int = _constants.START_X + _constants.STEP_X * x + x_offset
	var y_vector: int = _constants.START_Y + _constants.STEP_Y * y + y_offset

	return Vector2(x_vector, y_vector)


