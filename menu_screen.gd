extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
	get_tree().change_scene_to_file("res://scenes/main.tscn") # Replace with function body.
