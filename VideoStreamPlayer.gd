extends VideoStreamPlayer

func _ready():
	set_process( true )
func _process(delta):
	var isPlaying = is_playing()
	if isPlaying == false:
		play()

	pass
