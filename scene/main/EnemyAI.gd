extends Node2D

var _groupname := preload("res://library/GroupName.gd").new()

const Schedule := preload("res://scene/main/Schedule.gd")
var  _ref_schedule: Schedule

func _on_Schedule_turn_started(current_sprite: Sprite2D) -> void:
	if not current_sprite.is_in_group(_groupname.PC):
		return
		
	get_node("../Schedule").end_turn()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
