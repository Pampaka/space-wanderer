class_name PlayerShip
extends CharacterBody2D


@onready var weapon = $Blaster

const MAX_SPEED = 250.0

var speed = MAX_SPEED
var acceleration = 700.0
var friction = 500.0
var rotation_speed = acceleration / 30


func _ready() -> void:
	$Ship.play()
	$Blaster.initialize(self)


func _physics_process(delta: float) -> void:
	# Shooting
	weapon.is_shooting = Input.is_action_pressed("attack")
	if weapon.is_shooting:
		rotation = global_position.angle_to_point(get_global_mouse_position())
		
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	direction = direction.normalized()
	
	# Movement
	if direction:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
		$Ship.animation = "move"
		if not weapon.is_shooting:
			rotation = lerp_angle(rotation, direction.angle(), rotation_speed * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		$Ship.animation = "idle"
	
	if velocity.length() > speed:
		velocity = velocity.normalized() * speed;
	
	move_and_slide()
