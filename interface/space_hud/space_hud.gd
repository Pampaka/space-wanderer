extends Control


@onready var health_bar = $HealthBar

var player: PlayerShip


func initialize(player_ship: PlayerShip):
	player = player_ship
	
	health_bar.max_value = player.health.max_health
	health_bar.value = player.health.health
	player_ship.health.connect("changed", func (health, _value):
		health_bar.value = health)
