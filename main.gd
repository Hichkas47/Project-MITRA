extends Node2D

@export var speed = 150

var dir
var dist
var c = 10
var move = 1

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	dir = ($player.position - $enemy.position).normalized()
	dist = $player.position.distance_to($enemy.position)
	if dist > 100 and move:
		$enemy.position += dir * speed * delta
	else:
		move = 0
		$enemy.position.x += 5
		c -= 1
		if not c:
			move = 1
			c = 5

func near_anim():
	
	near_anim()

