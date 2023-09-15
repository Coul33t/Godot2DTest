extends Node2D

var __

# Called when the node enters the scene tree for the first time.
func _ready():
	# old way: var __ = get_node("../InitWorld").connect("sprite_created", self, "_on_InitWorld_sprite_created", [index])
	# new way: var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created.bind(index))
	__ = get_node("InitWorld").sprite_created.connect(get_node("PCmove")._on_InitWorld_sprite_created)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
