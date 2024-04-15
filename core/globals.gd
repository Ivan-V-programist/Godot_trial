extends Node


var points := 0
var lives := 3

func change_points(diff: int):
	points += diff
	Events.points_changed.emit(points)
	
func change_lives(diff: int):
	print("fuck")
	lives += diff
	Events.lives_changed.emit(lives)
	print("aah")
