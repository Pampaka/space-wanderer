extends Node2D


@export var bullet_scene: PackedScene
@export var bullet_texture: Texture2D
@export_flags_2d_physics var bullet_mask: int = 4

@export var damage = 3
@export var cool_down = 0.3

var blaster_owner: CharacterBody2D
var is_shooting = false
var time_since_last_shot = 0.0


func initialize(character: CharacterBody2D):
	blaster_owner = character


func _process(delta: float) -> void:
	time_since_last_shot += delta
	
	if is_shooting and time_since_last_shot >= cool_down:
		time_since_last_shot = 0.0
		
		var bullet = bullet_scene.instantiate()
		bullet.set_texture(bullet_texture)
		bullet.damage = damage
		bullet.global_position = global_position
		bullet.rotation = blaster_owner.rotation
		bullet.set_collision_mask(bullet_mask)
		
		get_tree().current_scene.add_child(bullet)
