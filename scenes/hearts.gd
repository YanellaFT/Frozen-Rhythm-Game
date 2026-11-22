extends Node2D

@export var jitter_amount: float = 10.0
@export var step_interval: float = 0.15

var _timer: float = 0.0
var _base_pos: Vector2

func _ready() -> void:
	_base_pos = position

func _process(delta: float) -> void:
	_timer += delta
	if _timer >= step_interval:
		_timer = 0.0
		position = _base_pos + Vector2(
			randf_range(-jitter_amount, jitter_amount),
			randf_range(-jitter_amount, jitter_amount)
		)
