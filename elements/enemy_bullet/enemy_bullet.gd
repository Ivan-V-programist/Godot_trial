extends CharacterBody2D

const SPEED = 40


func _physics_process(delta):
	var coll = move_and_collide(Vector2.DOWN*delta*SPEED)
	if coll:
		var collider = coll.get_collider()
		if collider.has_method("damage"):
			collider.damage()
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
