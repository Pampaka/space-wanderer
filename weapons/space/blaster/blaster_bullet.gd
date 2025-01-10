extends Area2D

var max_range = 300.0
var damage = 3
var speed = 700.0
var current_range = 0.0

func _ready() -> void:
	body_entered.connect(_body_entered)

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation).normalized()
	var distance = speed * delta
	global_position += direction * distance
	
	current_range += distance
	if current_range >= max_range:
		queue_free()


func set_texture(texture: Texture2D):
	$Sprite2D.texture = texture


func _body_entered(body: Node2D):
	if body.health:
		body.health.take_damage(damage)
	queue_free()
