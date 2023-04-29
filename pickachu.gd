extends Node2D
var random=RandomNumberGenerator.new()
var timer=0
var timer1=0
func _process(delta):
	var thunder=randi_range(0,5)
	timer+=delta
	if timer>=5:
		if thunder==1:
			timer=0
			$thunders/Area2D3/t3.play("t3")
			$thunders/Area2D2/t2.play("t2")
			$thunders/Area2D4/t4.play("t4")
		elif thunder==2:
			timer=0
			$thunders/Area2D3/t3.play("t3")
			$thunders/Area2D/t1.play("t1")
			$thunders/Area2D4/t4.play("t4")
		elif thunder==3:
			timer=0
			$thunders/Area2D/t1.play("t1")
			$thunders/Area2D2/t2.play("t2")
			$thunders/Area2D4/t4.play("t4")
		elif thunder==4:
			timer=0
			$thunders/Area2D/t1.play("t1")
			$thunders/Area2D3/t3.play("t3")
			$thunders/Area2D2/t2.play("t2")
			




func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()


func _on_area_2d_3_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()


func _on_area_2d_4_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()
