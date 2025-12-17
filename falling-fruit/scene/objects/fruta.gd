extends "res://scene/objects/falling_object_base.gd"

class_name fruta

@export var points: int = 1

func on_caught() -> void:
	GameManager.add_score(points)
