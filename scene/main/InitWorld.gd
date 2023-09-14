extends Node2D

const PLAYER := preload("res://sprites/pc.tscn")
const WALL := preload("res://sprites/wall.tscn")
const FLOOR := preload("res://sprites/floor.tscn")
const ENEMY := preload("res://sprites/enemy.tscn")
const STAIRS_UP := preload("res://sprites/stairs_up.tscn")
const STAIRS_DOWN := preload("res://sprites/stairs_down.tscn")

var _new_groupname := preload("res://library/GroupName.gd").new()
var _new_convertcoord := preload("res://library/ConvertCoord.gd").new()
var _new_dungeonsize := preload("res://library/DungeonSize.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_make_dummy_map()
	_create_sprite(PLAYER, _new_groupname.PC, 0, 0)

func _make_dummy_map() -> void:
	# Walls
	for x in _new_dungeonsize.MAX_X:
		_create_sprite(WALL, _new_groupname.WALL, x, 0)
		_create_sprite(WALL, _new_groupname.WALL, x, _new_dungeonsize.MAX_Y - 1)

	# -1 on both sides since we alkready did them when doing the top and bottom walls
	for y in range(1, _new_dungeonsize.MAX_Y - 1):
		_create_sprite(WALL, _new_groupname.WALL, 0, y)
		_create_sprite(WALL, _new_groupname.WALL, _new_dungeonsize.MAX_X - 1, y)

	for x in range(1, _new_dungeonsize.MAX_X - 1):
		for y in range(1, _new_dungeonsize.MAX_Y - 1):
			_create_sprite(FLOOR, _new_groupname.FLOOR, x, y)

func _create_sprite(prefab: PackedScene, group: String, x: int, y: int) -> void:
	var new_sprite = prefab.instantiate() as Sprite2D
	new_sprite.position = _new_convertcoord.index_to_vector(x, y)
	new_sprite.add_to_group(group)
	
	add_child(new_sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
