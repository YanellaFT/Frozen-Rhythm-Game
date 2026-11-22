extends Node2D

#const LOWEST_NOTE = 45
#const HIGHEST_NOTE = 99
#if SongManager.selected_song == "SongOne":
			#var LOWEST_NOTE = 45
			#var HIGHEST_NOTE = 99
			#var FALL_TIME = 1
		#"SongTwo":
			#var LOWEST_NOTE = 45
			#var HIGHEST_NOTE = 99
			#var FALL_TIME = 1
		#"SongThree":
			#var LOWEST_NOTE = 45
			#var HIGHEST_NOTE = 99
			#var FALL_TIME = 1
		#"SongFour":
			#mvar LOWEST_NOTE = 45
			#var HIGHEST_NOTE = 99
			#var FALL_TIME = 1

const LANE_X = [500.0, 650.0, 650.0, 1000.0]
const SPAWN_Y = 100.0
const HIT_Y = 700.0
const PERFECT_PX = 20.0

var note_scene := preload("res://scenes/note.tscn")
var score := 0
var combo := 0

var LOWEST_NOTE = 0
var HIGHEST_NOTE = 0
var FALL_TIME = 0

@onready var midi = $MidiPlayer
@onready var music = $AudioStreamPlayer
@onready var notes = $notes
@onready var hit_zones = $hitzones
@onready var score_label = $ui/Score
@onready var combo_label = $ui/Combo
@onready var judge_label = $ui/Judge

func _ready():
	match SongManager.selected_song:
		"SongOne":
			music.stream = load("res://songs/Frozen Heart (for reference).mp3")
			LOWEST_NOTE = 48
			HIGHEST_NOTE = 77
			FALL_TIME = 2
		"SongTwo":
			music.stream = load("res://songs/Frozen - Let it Go.mp3")
			LOWEST_NOTE = 58
			HIGHEST_NOTE = 70
			FALL_TIME = 1.75
		"SongThree":
			music.stream= load("res://songs/Snowman - Sia.mp3")
			LOWEST_NOTE = 36
			HIGHEST_NOTE = 90
			FALL_TIME = 2
		"SongFour":
			music.stream= load("res://songs/Jingle bells.mp3")
			LOWEST_NOTE = 60
			HIGHEST_NOTE = 70
			FALL_TIME = 2.5
			
	midi.note_offset = -FALL_TIME
	midi.link_audio_stream_player([music])
	midi.note.connect(_on_midi_note)
	midi.play()
		


	
func _on_midi_note(event, _track):
	if event["subtype"] != MIDI_MESSAGE_NOTE_ON:
		return
	var span = HIGHEST_NOTE - LOWEST_NOTE + 1
	var lane = clampi(int((event["note"] - LOWEST_NOTE) * 4.0 / span), 0, 3)
	spawn_note.call_deferred(lane)

func spawn_note(lane):
	var n = note_scene.instantiate()
	n.lane = lane
	n.position = Vector2(LANE_X[lane], SPAWN_Y)
	n.speed = (HIT_Y - SPAWN_Y) / FALL_TIME
	n.missed.connect(_on_note_missed)
	notes.add_child(n)
	
func _unhandled_input(event):
	for lane in 4:
		if event.is_action_pressed("lane_%d" % lane):
			try_hit(lane)

func try_hit(lane):
	var zone: Area2D = hit_zones.get_child(lane)
	var best = null
	var best_dist = INF
	for area in zone.get_overlapping_areas():
		var d = abs(area.global_position.y - HIT_Y)
		if d < best_dist:
			best = area
			best_dist = d
		if best == null:
			return
		best.queue_free()
		if best_dist <= PERFECT_PX:
			register("Perfect!")
		else:
			register("Good")

func _on_note_missed():
	register("Miss...")

func register(result):
	match result:
		"Perfect!":
			score += 300
			combo += 1
		"Good":
			score += 100
			combo += 1
		"Miss...":
			combo = 0
	judge_label.text = result
	score_label.text = "Score: %d" % score
	combo_label.text = "Combo: %d" % combo if combo > 1 else ""



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_screen.tscn")
