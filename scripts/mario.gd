extends Node2D

var timer = 0
var state_machine
var secen=0
@export var hp = 1000
@export var goombas_falling = 0


func _ready():
	$StaticBody2D4/pipes.play("itsjustmain")
	$sakurai.play("mushroom_dash")
	$fire.play("new_animation")
	state_machine = $marios.get("parameters/playback")
	
	
func _process(delta):
	#dath
	if hp < 0:
		$StaticBody2D.hide()

	timer+=delta
	if timer>= 5:
		state_machine.travel("ready")
		secen+=delta
		if secen>=2:
		
			state_machine.travel("fire")
			timer=0
			secen=0


func _on_area_2d_body_entered(body):
	if body.is_in_group("fist"):
		hp = hp - 20
		$dam.play("dam")
		print(str(hp))


func _on_fire_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()
		print("bommm")


func _on_sakur_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()
		print("bommm")
