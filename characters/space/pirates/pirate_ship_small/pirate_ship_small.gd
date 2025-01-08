extends CharacterBody2D


signal died

@onready var weapon = $Blaster

var health = 10

var max_speed = 200.0
var speed = max_speed
var acceleration = 700.0
var friction = 500.0
var rotation_speed = acceleration / 30

var target: Node2D
var max_distance_to_target = 190
var min_distance_to_target = 170
var attack_distance_to_target = 250


func _ready() -> void:
	$Ship.play()
	weapon.initialize(self)


func _physics_process(delta: float) -> void:
	# Movement
	if target:
		var direction = global_position.direction_to(target.global_position)
		var distance = global_position.distance_to(target.global_position)
		
		# Shooting
		weapon.is_shooting = distance <= attack_distance_to_target
	
		if distance > max_distance_to_target:
			velocity = velocity.move_toward(direction * speed, acceleration * delta)
		elif distance < min_distance_to_target:
			velocity = velocity.move_toward(direction * -1 * speed, acceleration * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		rotation = lerp_angle(rotation, direction.angle(), rotation_speed * delta)
		$Ship.animation = "move"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		$Ship.animation = "idle"
	
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed;
	
	move_and_slide()


func take_damage(damage: int):
	health -= damage
	if health <= 0:
		die()


func die():
	health = 0
	died.emit()
	queue_free()


func _on_aggro_zone_body_entered(body: Node2D) -> void:
	if not target:
		target = body
		$AggroZone.scale = Vector2(35, 35)


func _on_aggro_zone_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
		$AggroZone.scale = Vector2(30, 30)
