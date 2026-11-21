extends Area2D

signal missed

var lane := 0
var speed := 300.0 
var miss_y := 880.0

func _process(delta):
	position.y += speed * delta
	if position.y > miss_y:
		missed.emit()
		queue_free()
