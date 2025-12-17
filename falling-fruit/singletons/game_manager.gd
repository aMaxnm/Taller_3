extends Node

signal on_score_update(score: int)
signal on_life_update(lives: int)
signal on_game_over

var score: int = 0
var lives: int = 3

func add_score(amount: int) -> void:
	score = max(0, score + amount) # opcional: no bajar de 0
	print("Score:", score)
	on_score_update.emit(score)

func lose_life(amount: int = 1) -> void:
	lives -= amount
	print("Lives:", lives)
	on_life_update.emit(lives)
	if lives <= 0:
		game_over()

func game_over() -> void:
	print("GAME OVER")
	on_game_over.emit()
