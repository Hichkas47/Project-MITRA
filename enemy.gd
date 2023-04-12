extends StaticBody2D

@export var hp = 4

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		hp = hp - 1
		print("ookh")
	
func _process(delta):
	if hp < 1 :
		queue_free()
