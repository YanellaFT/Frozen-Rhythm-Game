extends Button


func _on_control_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
