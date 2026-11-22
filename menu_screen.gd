extends Control

func _on_pick_btn_pressed() -> void:
	SongManager.selected_song="SongOne"
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_pick_btn_2_pressed() -> void:
	SongManager.selected_song="SongTwo"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_pick_btn_3_pressed() -> void:
	SongManager.selected_song="SongThree"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_pick_btn_4_pressed() -> void:
	SongManager.selected_song="SongFour"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://home_screen.tscn")


func _on_button_pressed() -> void:
	if $AudioStreamPlayer.playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.play()
