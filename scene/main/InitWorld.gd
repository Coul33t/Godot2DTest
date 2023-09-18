extends Node2D

signal sprite_created(new_sprite)

const PLAYER := preload("res://sprites/pc.tscn")
const WALL := preload("res://sprites/wall.tscn")
const FLOOR := preload("res://sprites/floor.tscn")
const ENEMY := preload("res://sprites/enemy.tscn")
const STAIRS_UP := preload("res://sprites/stairs_up.tscn")
const STAIRS_DOWN := preload("res://sprites/stairs_down.tscn")

var _constants := preload("res://library/Constants.gd").new()
var _tools := preload("res://library/Tools.gd").new()
var _groupname := preload("res://library/GroupName.gd").new()
var _inputname := preload("res://library/InputName.gd").new()

var _initialised = false

func _init_dungeon() -> void:
	_make_dummy_map()


func _init_player() -> void:
	_create_sprite(PLAYER, _groupname.PC, 0, 0)


func _make_dummy_map() -> void:
	# Walls
	for x in _constants.MAX_X:
		_create_sprite(WALL, _groupname.WALL, x, 0)
		_create_sprite(WALL, _groupname.WALL, x, _constants.MAX_Y - 1)

	# -1 on both sides since we alkready did them when doing the top and bottom walls
	for y in range(1, _constants.MAX_Y - 1):
		_create_sprite(WALL, _groupname.WALL, 0, y)
		_create_sprite(WALL, _groupname.WALL, _constants.MAX_X - 1, y)

	for x in range(1, _constants.MAX_X - 1):
		for y in range(1, _constants.MAX_Y - 1):
			_create_sprite(FLOOR, _groupname.FLOOR, x, y)


func _create_sprite(prefab: PackedScene, group: String, x: int, y: int) -> void:
	var new_sprite = prefab.instantiate() as Sprite2D
	new_sprite.position = _tools.index_to_vector(x, y)
	new_sprite.add_to_group(group)
	
	add_child(new_sprite)
	
	emit_signal("sprite_created", new_sprite)

func init_world() -> void:
	_init_dungeon()
	_init_player()
	
func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed(_inputname.INIT_WORLD):
		init_world()
		set_process_unhandled_input(false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
