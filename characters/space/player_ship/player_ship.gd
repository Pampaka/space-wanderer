class_name PlayerShip
extends CharacterBody2D


@onready var weapon = $Blaster

var max_speed = 250.0
var speed = max_speed
var acceleration = 700.0
var friction = 500.0
var rotation_speed = acceleration / 30


func _ready() -> void:
	$Ship.play()
	$Blaster.initialize(self)


func _physics_process(delta: float) -> void:
	# Shooting
	weapon.is_shooting = Input.is_action_pressed("attack")
	
	# Movement
	var direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	direction = direction.normalized()
	
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
	
	# Rotation
	var view_direction = Input.get_vector("view_left", "view_right", "view_up", "view_down")
	if view_direction:
		rotation = view_direction.angle()
	elif weapon.is_shooting:
		rotation = global_position.angle_to_point(get_global_mouse_position())
	elif direction:
		rotation = lerp_angle(rotation, direction.angle(), rotation_speed * delta)
	
	move_and_slide()
