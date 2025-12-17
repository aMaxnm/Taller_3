extends Node

signal on_score_update(score: int)
signal on_life_update(lives: int)
signal on_game_over

func _ready() -> void:
	GameManager.on_score_update.connect(on_score_update.emit)
	GameManager.on_life_update.connect(on_life_update.emit)
	GameManager.on_game_over.connect(on_game_over.emit)
