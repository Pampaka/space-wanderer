class_name SpaceLevel
extends Level


@onready var camera = $Camera


func initialize(player_ship: PlayerShip, spawner_id: int = 1) -> void:
	super.initialize(player_ship, spawner_id)
	
	# Spawn
	for child in get_children():
		if child is PlayerSpawner:
			add_child(player_ship)
			player_ship.global_position = child.global_position
	
	# Camera
	camera.global_position = player_ship.global_position
	camera.target = player_ship
