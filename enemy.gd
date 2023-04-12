extends CharacterBody2D

@export var active = 1
@export var hp = 7

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		hp = hp - 1
		$AnimationPlayer.play("ookh")
	
func _process(delta):
	if hp < 1 :
		queue_free()
