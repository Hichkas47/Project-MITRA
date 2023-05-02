extends CharacterBody2D

#@export var hp = 100
@export var active = 1
@export var speed = 400
@onready var anim = $CharacterBody2D/AnimationPlayer
@onready var dur = $Timer.time_left
@onready var fist = $CharacterBody2D/Node/fist_collision
var pnom = 0

func _ready():
	randomize()
	

func get_input():
	if Input.is_action_just_pressed("jump"):
		$jumpPlayer.play("jump")
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
				anim.play("fist")
				pnom = pnom + 1
			
#	if $Timer.time_left < 0.1:
#		pnom = 0
#		print(pnom)
	if pnom > 4:
		pnom = -1
		
	#anim
	if pnom == -1:
		anim.play("idle")
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
		
	#if player can move if its punvhing>>>>>>>
	if pnom >= 0:
		speed = 0
	else:
		speed = 400 

func _physics_process(_delta):
#	$Node/ProgressBar.value = hp
#
#	if hp <= 0:
#		hide()
	
	#the facing mech masalan>>>
	if Input.is_action_pressed("left"):
		$poser.play("l")
	if Input.is_action_pressed("right"):
		$poser.play("r")
	
	var dur = $Timer.time_left

	get_input()
	move_and_slide()
	punching()
	#coll tesating if its on check this out later soroush >>>
	if fist.disabled:
		fist.visible = false
	
	else:
		fist.visible = true
	
	

func fall():
	#play.fall
	pass
func _on_timer_timeout():
	pnom = -1
	

#func get_damage():
#	hp = hp - 10
#	anim.play("dam")
