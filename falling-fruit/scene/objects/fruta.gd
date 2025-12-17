extends "res://scene/objects/falling_object_base.gd"

class_name fruta

func _ready() -> void:
	super()
	points_value = randi_range(1, 5) # RANDOM AQUÍ
	fall_speed = randf_range(200, 450)
func on_caught() -> void:
	GameManager.add_score(points_value)
