extends CharacterBody2D
class_name Player

@onready var sprite: Sprite2D = $Sprite2D

@export var movement_speed: float = 20000.0
@export var dash_multiplier: float = 3.0
@export var dash_duration: float = 0.15

var _screen_size
var is_dashing := false
var dash_timer := 0.0

func _ready():
	_screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	_handle_dash(delta)
	_handle_movement(delta)

	position.x = clampf(position.x, 0, _screen_size.x)
	move_and_slide()

func _handle_movement(delta: float) -> void:
	var speed := movement_speed
	if is_dashing:
		speed *= dash_multiplier

	var direction := Input.get_axis("move_L", "move_R")

	# FLIP DEL SPRITE
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false

	velocity.x = direction * speed * delta


func _handle_dash(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and not is_dashing:
		is_dashing = true
		dash_timer = dash_duration

	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false

func _on_hit_box_area_entered(area: Area2D) -> void:
	print("catch")
	SignalManager.on_player_catch.emit()
