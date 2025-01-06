class_name Game
extends Node


@export_dir var level_path: String
@onready var player_ship = $PlayerShip


func _ready() -> void:
	remove_child(player_ship)

	var level_scene = load(level_path)
	if not level_scene:
		return

	var level: Level = level_scene.instantiate()
	add_child(level)
	
	level.initialize(player_ship)
