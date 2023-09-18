extends Node2D

signal turn_started(current_srpite)

var _groupname := preload("res://library/GroupName.gd").new()

var _current_entity_idx: int = 0
var _actors: Array = [null]

# Go to next entity to act
func _goto_next() -> void:
	_current_entity_idx += 1
	
	if _current_entity_idx > len(_actors) - 1:
		_current_entity_idx = 0

# Returns current entity
func _get_current() -> Sprite2D:
	return _actors[_current_entity_idx] as Sprite2D
	
# End turn of current entity
func end_turn() -> void:
	print("{0}: end of turn.".format([_get_current().name]))
	_goto_next()
	emit_signal("turn_started", _get_current())

	
func _on_InitWorld_sprite_created(new_sprite: Sprite2D) -> void:
	if new_sprite.is_in_group(_groupname.PC):
		_actors[0] = new_sprite
	elif new_sprite.is_in_group(_groupname.ENEMY):
		_actors.append(new_sprite)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
