extends Area2D
class_name FallingObjectBase

# --- Velocidad de caída ---
@export var fall_speed: float = 250.0:
	set(value):
		fall_speed = max(0.0, value) # nunca negativa
	get:
		return fall_speed

# --- Puntos ---
@export var points_value: int = 1:
	set(value):
		points_value = value
	get:
		return points_value

@export var sprite_dict := {
	"apple": [preload("res://assets/objects/apple.png")],
	"banana": [preload("res://assets/objects/banana.png")],
	"grape": [preload("res://assets/objects/grape.png")],
	"strawberry": [preload("res://assets/objects/strawberry.png")],
	"watermelon": [preload("res://assets/objects/watermelon.png")]
}

func _ready() -> void:
	randomize_sprite()

func _process(delta: float) -> void:
	global_position.y += fall_speed * delta

# Este método lo “sobrescriben” las hijas
func on_caught() -> void:
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("bye")
	queue_free()

func randomize_sprite() -> void:
	if sprite_dict.is_empty():
		return

	var keys: Array = sprite_dict.keys()
	var fruit_key: String = keys.pick_random()

	var textures: Array = sprite_dict[fruit_key]
	if textures.is_empty():
		return

	$Sprite2D.texture = textures.pick_random() as Texture2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Catcher"):
		on_caught()
		queue_free()
