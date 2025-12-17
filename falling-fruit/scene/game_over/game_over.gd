extends CanvasLayer

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var continue_label: Label = $MarginContainer/VBoxContainer/ContinueLabel

var can_return_to_menu: bool = false

func _ready() -> void:
	visible = false
	can_return_to_menu = false
	SignalManager.on_game_over.connect(show_game_over)
	
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("dash") and can_return_to_menu):
		SignalManager.on_restart_game.emit()

func show_game_over() -> void:
	get_tree().paused = true
	visible = true
	continue_label.visible = false
	anim_player.play("GameOver")
	continue_label.visible = true
	anim_player.queue("continuelabel")
	can_return_to_menu = true
