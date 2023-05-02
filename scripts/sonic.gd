extends Node2D

var timer=0
var timer1=0
var state_machine
var hp=15
@onready var sonic = $RigidBody2D
func _ready():
	sonic.freeze = false
	$RigidBody2D.linear_velocity.y=600
	$RigidBody2D.linear_velocity.x=600
	state_machine = $AnimationTree.get("parameters/playback")
#	state_machine.travel("boost")

func _process(delta):
	var ro = 0 - $RigidBody2D.rotation
	print(ro)
	if hp<0:
		$RigidBody2D.hide()
	timer+=delta
#	print(timer)

	if timer>=9 and $RigidBody2D.position.y>450:
#		$RigidBody2D.linear_velocity=Vector2.ZERO
		state_machine.travel("dizzy")
		####
		$RigidBody2D/Image021.rotation = ro
		sonic.freeze = true
		timer1+=delta
		if timer1>=5:
			state_machine.travel("idle")
			sonic.freeze = true
		if timer1>= 7:
			state_machine.travel("boost")
			sonic.freeze = true
		if timer1>= 7.5:
			sonic.freeze = false
			timer=0 
			timer1=0
			$RigidBody2D.linear_velocity.y=600
			$RigidBody2D.linear_velocity.x=600
#			state_machine.travel("spin")


func _on_area_2d_body_entered(body):
	if body.is_in_group("fist"):
		hp-=1
		print("hit")

	if body.is_in_group("player"):
		body.get_damage()
		#body.fall()




