extends Node2D

const Schedule := preload("res://scene/main/Schedule.gd")
var  _ref_schedule: Schedule

var _inputname := preload("res://library/InputName.gd").new()
var _groupname := preload("res://library/GroupName.gd").new()
var _tools := preload("res://library/Tools.gd").new()

var _pc: Sprite2D

func _is_move_event(event: InputEvent) -> bool:
	for move_event in _inputname.MOVE_INPUTS:
		if event.is_action_pressed(move_event):
			return true
			
	return false
	
func _get_new_position(event: InputEvent, source: Vector2) -> Vector2:
		
	var dx: int = 0
	var dy: int = 0
	
	if event.is_action_pressed(_inputname.MOVE_UP):
		dy = -1

	elif event.is_action_pressed(_inputname.MOVE_RIGHT):
		dx = 1
	
	elif event.is_action_pressed(_inputname.MOVE_DOWN):
		dy = 1
		
	elif event.is_action_pressed(_inputname.MOVE_LEFT):
		dx = -1
		
	return Vector2(source.x + dx, source.y + dy)


func _unhandled_input(event: InputEvent) -> void:
	var target: Array

	if _is_move_event(event):
		_pc.position = _get_new_position(event, _pc.position)
		set_process_unhandled_input(false)
		_ref_schedule.end_turn()
	

func _on_Schedule_turn_started(current_sprite: Sprite2D) -> void:
	if current_sprite.is_in_group(_groupname.PC):
		set_process_unhandled_input(true)
	else:
		print(current_sprite.name)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	# old way: var __ = get_node("../InitWorld").connect("sprite_created", self, "_on_InitWorld_sprite_created", [index])
	# new way: var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created.bind(index))
	# var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created)
	# print("connect: {0}".format([__]));
	set_process_unhandled_input(false)

func _on_InitWorld_sprite_created(new_sprite: Sprite2D) -> void:
	if new_sprite.is_in_group(_groupname.PC):
		_pc = new_sprite
		set_process_unhandled_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
