extends CharacterBody2D

@export var speed = 400
var pnom = 0
@onready var dur = $Timer.time_left
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed	

func punching():
	if Input.is_action_just_pressed("attack"):
		$Timer.start()
		
		if dur > 0 :
			if $Timer2.time_left < 0.1: 
				$Timer2.start()
				print("punched")
				print(pnom)
				$AnimationPlayer.play("fist")
				pnom = pnom + 1
			
	if $Timer.time_left < 0.1:
		pnom = 0
	if pnom > 4:
		pnom = 0

func _physics_process(delta):
	var dur = $Timer.time_left

	get_input()
	move_and_slide()
	punching()
