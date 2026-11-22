extends Control

func _on_control_pressed() -> void:
	print("control pressed")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_screen.tscn")

func _on_credits_pressed() -> void:
	print("credits pressed")
