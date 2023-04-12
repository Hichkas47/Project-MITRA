extends CharacterBody2D

@export var active = 1
@export var speed = 400
@onready var anim = $AnimationPlayer
@onready var dur = $Timer.time_left
var pnom = 0
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
			
#	if $Timer.time_left < 0.1:
#		pnom = 0
#		print(pnom)
	if pnom > 4:
		pnom = -1
		
	#anim
	if pnom == -1:
		anim.play("RESET")
	if pnom == 0 :
		anim.play("fist")
	if pnom == 1 :
		anim.play("fist1")
	if pnom == 2:
		anim.play("fist2")
	if pnom == 3:
		anim.play("fist3")
	if pnom == 4:
		anim.play("fist4")
		

func _physics_process(delta):
	var dur = $Timer.time_left

	get_input()
	move_and_slide()
	punching()
	
	#coll tesating if its on >>>
	if $fist_collision.disabled:
		$fist_collision/Icon.visible = false
	
	else:
		$fist_collision/Icon.visible = true
	
	#if player can move if its punvhing>>>>>>>
	
	if active == 0:
		speed = 0
	elif active == 1:
		speed = 400 


func _on_timer_timeout():
	pnom = -1
