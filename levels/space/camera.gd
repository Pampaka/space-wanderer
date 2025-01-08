extends Camera2D


var target: Node2D
var target_offset: Vector2 = Vector2.ZERO
var follow_speed = 5.0


func _physics_process(delta: float) -> void:
	if target:
		var target_position = target.global_position + target_offset
		global_position = global_position.lerp(target_position, follow_speed * delta)
