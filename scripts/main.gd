extends Node2D
signal credit
	
func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_key_pressed(KEY_Z):
		emit_signal("credit")
