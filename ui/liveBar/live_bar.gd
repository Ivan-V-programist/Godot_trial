extends HBoxContainer

var RECT_SCENE = preload("res://ui/liveBar/live_rect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.lives_changed.connect(update_lives)
	update_lives(Globals.lives)
	
func update_lives(lives: int):
	var diff = lives - get_child_count()
	for i in range(abs(diff)):
		add_life() if diff > 0 else remove_life()

func add_life():
	add_child(RECT_SCENE.instantiate())
	
func remove_life():
	get_child(0).queue_free()
