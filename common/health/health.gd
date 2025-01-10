extends Node


signal changed(health: int, value: int)
signal over()

@export var max_health = 10
@export var health = 10 


func heal(amount: int):
	_change_health(amount)


func take_damage(damage: int):
	_change_health(-damage)


func _change_health(value: int):
	health += value
	health = clamp(health, 0, max_health)
	changed.emit(health, value)
	if health == 0:
		over.emit()
