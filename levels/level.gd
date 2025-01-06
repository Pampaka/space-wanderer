class_name Level
extends Node


#@onready var hud = $Interface/HUD


func initialize(_player_ship: PlayerShip, _spawner_id: int = 1) ->  void:
	pass
	#$Interface/HUD.initialize(player_ship)


#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("cancel") and $Interface/PauseMenu.hidden:
		#$Interface/PauseMenu.open()
		#set_process_input(false)
#
#
#func _on_pause_menu_closed() -> void:
	#set_process_input(true)
