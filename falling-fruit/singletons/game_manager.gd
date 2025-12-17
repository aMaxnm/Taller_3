extends Node

var score: int = 0
var lives: int = 3
func _ready() -> void:
	SignalManager.on_player_catch.connect(on_catch)


func add_score(amount: int) -> void:
	score = max(0, score + amount) # opcional: no bajar de 0
	print("Score:", score)

func lose_life(amount: int = 1) -> void:
	lives -= amount
	print("Lives:", lives)
	if lives <= 0:
		game_over()

func game_over() -> void:
	print("GAME OVER")

func on_catch():
	print("+1")
