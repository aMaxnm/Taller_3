extends Node2D

@export var fruit_to_spawn: PackedScene

var screen_size: Vector2
var offset = 50

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _on_timer_timeout() -> void:
	var new_fruit = fruit_to_spawn.instantiate()
	var rand_pos_x = randf_range(0 + offset, screen_size.x - offset )
	new_fruit.global_position = Vector2(rand_pos_x, position.y)
	get_tree().get_current_scene().add_child(new_fruit)
