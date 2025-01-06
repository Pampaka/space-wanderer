extends Node2D


@export var bullet_scene: PackedScene

var player: CharacterBody2D
var cool_down = 0.3
var time_since_last_shot = 0.0


func initialize(character: CharacterBody2D):
	player = character


func _process(delta: float) -> void:
	time_since_last_shot += delta
	
	if Input.is_action_pressed("attack") and time_since_last_shot >= cool_down:
		time_since_last_shot = 0.0
		
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.rotation = player.rotation
		get_tree().current_scene.add_child(bullet)
