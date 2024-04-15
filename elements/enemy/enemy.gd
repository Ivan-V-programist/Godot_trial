extends CharacterBody2D

@onready var ray_cast_left := $RayCastLeft
@onready var ray_cast_right := $RayCastRight
const BULLET_SCENE = preload("res://elements/enemy_bullet/enemy_bullet.tscn")
func _physics_process(delta):
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		get_tree().call_group("enemy_group", "other_way")

func death():
	Globals.change_points(1)
	queue_free()

func attack():
	var bullet = BULLET_SCENE.instantiate()
	bullet.global_position += global_position + Vector2(0,10)
	add_child(bullet)
