extends Node2D

var __

# Called when the node enters the scene tree for the first time.
func _ready():
	# old way: var __ = get_node("../InitWorld").connect("sprite_created", self, "_on_InitWorld_sprite_created", [index])
	# new way: var __ = get_node("../InitWorld").sprite_created.connect(_on_InitWorld_sprite_created.bind(index))
	__ = get_node("InitWorld").sprite_created.connect(get_node("PCmove")._on_InitWorld_sprite_created)
	__ = get_node("InitWorld").sprite_created.connect(get_node("Schedule")._on_InitWorld_sprite_created)
	
	__ = get_node("Schedule").turn_started.connect(get_node("PCmove")._on_Schedule_turn_started)
	__ = get_node("Schedule").turn_started.connect(get_node("EnemyAI")._on_Schedule_turn_started)
	
	get_node("PCmove")._ref_schedule = get_node("Schedule")
	get_node("EnemyAI")._ref_schedule = get_node("EnemyAI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
