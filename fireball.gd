extends Area2D
@onready var speed=1000
@onready var path_follow= get_parent()
@export var fire = 0 

func _process(delta):
	if fire:
		get_parent().set_progress(get_parent().get_progress()+speed*delta)
		if get_parent().get_progress_ratio() == 1:
			queue_free()
	
	
	
