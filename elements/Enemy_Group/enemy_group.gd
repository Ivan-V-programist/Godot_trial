extends Node2D

var direction := Vector2.RIGHT
var SPEED := 20.0
const acceleration := 1.2
@onready var block := $DirectionTimer
@onready var shoot := $shootTimer
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += direction * SPEED * delta

func other_way():
	if block.time_left > 0:
		return 
	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += 5
	SPEED *= acceleration
	block.start()
	



func _on_shoot_timer_timeout():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() > 0:
		enemies.pick_random().attack()
