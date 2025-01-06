extends Control


@export var game_scene_path: String


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file(game_scene_path)


func _on_quit_pressed() -> void:
	get_tree().quit()
