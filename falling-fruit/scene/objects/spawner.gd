extends Node2D

@export var fruit_to_spawn: PackedScene
@export var bomb_to_spawn: PackedScene
@export var bomb_chance: float = 0.50

var screen_size: Vector2
var offset := 50

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _on_timer_timeout() -> void:
	var scene_to_spawn: PackedScene

	if randf() < bomb_chance:
		scene_to_spawn = bomb_to_spawn
	else:
		scene_to_spawn = fruit_to_spawn

	# Seguridad extra (muy recomendada)
	if scene_to_spawn == null:
		push_error("Spawner: PackedScene no asignada")
		return

	var item = scene_to_spawn.instantiate()

	var rand_pos_x := randf_range(offset, screen_size.x - offset)
	item.global_position = Vector2(rand_pos_x, position.y)

	get_tree().current_scene.add_child(item)
