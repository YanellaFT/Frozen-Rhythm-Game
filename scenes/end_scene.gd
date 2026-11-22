extends Control

@onready var score_label = $score

func _ready():
	score_label.text = "Score: %d" % Globals.score


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://home_screen.tscn")
