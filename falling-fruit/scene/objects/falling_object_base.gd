extends Area2D

@export var fall_speed: float = 250.0

func _process(delta: float) -> void:
	global_position.y += fall_speed * delta

# Este método lo “sobrescriben” las hijas
func on_caught() -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	# Si el jugador tiene un Area2D con grupo "Catcher"
	if area.is_in_group("Catcher"):
		on_caught()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
