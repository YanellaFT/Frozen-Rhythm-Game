extends AudioStreamPlayer

func switch_music() -> void:
	if playing:
		stream_paused = true 
	else:
		if stream_paused:
			stream_paused = false 
		else:
			play()
