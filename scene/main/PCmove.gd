extends Node2D

var _new_inputname := preload("res://library/InputName.gd").new()
var _new_groupname := preload("res://library/GroupName.gd").new()
var _new_convertcoord := preload("res://library/ConvertCoord.gd").new()

var _pc: Sprite2D

func _unhandled_input(event: InputEvent) -> void:
	var dx: int = 0
	var dy: int = 0
	
	if event.is_action_pressed(_new_inputname.MOVE_UP):
		dy = -1

	elif event.is_action_pressed(_new_inputname.MOVE_RIGHT):
		dx = 1
	
	elif event.is_action_pressed(_new_inputname.MOVE_DOWN):
		dy = 1
		
	elif event.is_action_pressed(_new_inputname.MOVE_LEFT):
		dx = -1
		
	var source: Array = _new_convertcoord.vector_to_array(_pc.position)
	var x: int = source[0]
	var y: int = source[1]
		
	_pc.position = _new_convertcoord.index_to_vector(x + dx, y + dy);
	

# Called when the node enters the scene tree for the first time.
func _ready():
	# old way: var __ = get_node("../InitWorld").connect("sprite_created", self, "_on_InitWorld_sprite_created", [index])
	# new way: var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created.bind(index))
	# var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created)
	# print("connect: {0}".format([__]));
	set_process_unhandled_input(false)

func _on_InitWorld_sprite_created(new_sprite: Sprite2D) -> void:
	if new_sprite.is_in_group(_new_groupname.PC):
		_pc = new_sprite
		set_process_unhandled_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
