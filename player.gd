extends CharacterBody2D

var speedx = 0
var speedy = 0

@onready var animplay = $AnimationPlayer 

func _process(delta):
	
	if Input.is_action_pressed("attack"):
		animplay.play("fist")
	
	if Input.is_action_pressed("right"):
		speedx = min(700, speedx + 100)
	if Input.is_action_pressed("left"):
		speedx = max(-700, speedx - 100)
	if Input.is_action_just_released("right") or Input.is_action_just_released("left"):
		speedx = 0
		
	if Input.is_action_pressed("up"):
		speedy = min(700, speedy - 100)
	if Input.is_action_pressed("down"):
		speedy = max(-700, speedy + 100)
	if Input.is_action_just_released("up") or Input.is_action_just_released("down"):
		speedy = 0 
	
	var diffx = speedx * delta
	var diffy = speedy * delta

	if speedx > 0:
		position.x = min(position.x + diffx, 1920)
	elif speedx < 0:
		position.x = max(position.x + diffx, 0)
	
	if speedy < 0:
		position.y = min(position.y + diffy, 1080)
	elif speedy > 0:
		position.y = max(position.y + diffy, 0)
