extends CharacterBody2D


signal died

var health = 10


func take_damage(damage: int):
	health -= damage
	if health <= 0:
		die()


func die():
	health = 0
	died.emit()
	queue_free()
