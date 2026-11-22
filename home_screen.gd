extends Control

func _on_control_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/practice.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_screen.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	

func _on_button_pressed() -> void:
	if $AudioStreamPlayer.playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.play()
