extends Node
var menu_scene: PackedScene = preload("res://scene/menu/menu.tscn")
var score: int = 0
var lives: int = 3

func _ready() -> void:
	score = 0
	SignalManager.on_restart_game.connect(return_to_menu)

func return_to_menu():
	get_tree().paused = false
	score = 0
	get_tree().change_scene_to_packed(menu_scene)
func add_score(amount: int) -> void:
	score = max(0, score + amount)
	SignalManager.on_score_update.emit(score)

func lose_life(amount: int = 1) -> void:
	lives -= amount
	SignalManager.on_life_update.emit(lives)

	if lives <= 0:
		game_over()

func game_over() -> void:
	lives = 3
	SignalManager.on_game_over.emit()
