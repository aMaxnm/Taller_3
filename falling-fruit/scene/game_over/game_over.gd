extends CanvasLayer

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var continue_label: Label = $MarginContainer/VBoxContainer/ContinueLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_player_defeated.connect(show_game_over)


func show_game_over():
	get_tree().paused = true
	visible = true
	anim_player.play("GameOver")
	continue_label.visible = true
	anim_player.queue("continuelabel")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
