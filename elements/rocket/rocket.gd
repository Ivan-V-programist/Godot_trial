extends CharacterBody2D


const SPEED = 200.0

func _physics_process(delta):
	var coll = move_and_collide(Vector2.UP*SPEED*delta)
	if coll:
		var collider = coll.get_collider()
		if collider.has_method("death"):
			collider.death()
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
