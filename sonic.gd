extends Node2D

var timer=0
var timer1=0

var hp=15
func _process(delta):
	if hp<0:
		$RigidBody2D.hide()
	timer+=delta
	print(timer1)
	
	if timer>=5 and $RigidBody2D.position.y>450:
		$RigidBody2D.linear_velocity=Vector2.ZERO
		timer1+=delta
		if timer1>=5:
			timer=0 
			timer1=0
			$RigidBody2D.linear_velocity.y=600
			$RigidBody2D.linear_velocity.x=600
			

func _on_area_2d_body_entered(body):
	if body.is_in_group("fist"):
		hp-=1
		print("hit")
		
	if body.is_in_group("player"):
		body.get_damage()
		#body.fall()



	
