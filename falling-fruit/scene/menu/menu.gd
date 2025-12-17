extends MarginContainer

var main_level_scene = preload("res://scene/main_level/main_level.tscn")
var credit_scene = preload("res://scene/CREDITS/credits.tscn")
var bg_music = load("res://assets/music/Pianta Village - Super Mario Sunshine Music Extended.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music("res://assets/music/Pianta Village - Super Mario Sunshine Music Extended.mp3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_level_scene)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_packed(credit_scene)
