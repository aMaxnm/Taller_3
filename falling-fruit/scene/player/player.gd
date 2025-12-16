extends CharacterBody2D

class_name Player 

var movement_speed: float = 200.0

var _screen_size

func _ready():
	_screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	#region movimiento de jugador
	if(Input.is_action_pressed("move_L")):
		velocity.x = -movement_speed * delta
	elif(Input.is_action_pressed("move_R")):
		velocity.x = movement_speed * delta
	#endregion
