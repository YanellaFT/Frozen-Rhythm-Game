extends Control

func _on_control_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/practice.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_credits_pressed() -> void:
	print("credits pressed")
	
