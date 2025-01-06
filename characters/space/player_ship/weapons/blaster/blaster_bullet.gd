extends Area2D

const MAX_RANGE = 500.0

var speed = 700.0
var range = 0.0

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation).normalized()
	var distance = speed * delta
	global_position += direction * distance
	
	range += distance
	if range >= MAX_RANGE:
		queue_free()
