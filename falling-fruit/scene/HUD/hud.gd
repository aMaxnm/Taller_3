extends CanvasLayer

@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var life_label: Node = $MarginContainer2/LifeLabel

func _ready() -> void:
	SignalManager.on_score_update.connect(update_score)
	SignalManager.on_life_update.connect(update_lives)

func update_score(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)

func update_lives(current_lives: int) -> void:
	for i in range(life_label.get_child_count()):
		var heart = life_label.get_child(i)
		heart.visible = i < current_lives

	if current_lives <= 0:
		trigger_game_over()

func trigger_game_over() -> void:
	print("Game Over")
	SignalManager.on_game_over.emit()
