extends Area2D

const MAX_RANGE = 500.0

var damage = 3
var speed = 700.0
var current_range = 0.0

func _ready() -> void:
	body_entered.connect(_body_entered)

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation).normalized()
	var distance = speed * delta
	global_position += direction * distance
	
	current_range += distance
	if current_range >= MAX_RANGE:
		queue_free()


func _body_entered(body: Node2D):
	if body.take_damage:
		body.take_damage(damage)
		queue_free()
