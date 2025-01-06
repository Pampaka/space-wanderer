class_name PlayerShip
extends CharacterBody2D


const MAX_SPEED = 250.0

var speed = MAX_SPEED
var acceleration = 700.0
var friction = 500.0
var rotation_speed = acceleration / 30


func _ready() -> void:
	$Ship.play()
	$Blaster.initialize(self)


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	direction = direction.normalized()
	
	if direction:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
		rotation = lerp_angle(rotation, direction.angle(), rotation_speed * delta)
		$Ship.animation = "move"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		$Ship.animation = "idle"
	
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed;

	move_and_slide()
