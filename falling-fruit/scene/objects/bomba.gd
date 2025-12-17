extends "res://scene/objects/falling_object_base.gd"
class_name Bomba

@export var life_penalty: int = 1

func _ready() -> void:
	fall_speed = randf_range(300, 550)

func on_caught() -> void:
	GameManager.lose_life(life_penalty)
