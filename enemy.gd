extends CharacterBody2D

@export var active = 1
@export var hp = 7

func _ready():
	randomize()

func _process(delta):
	if not hp:
		hide()

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		hp -= 1
		$AnimationPlayer.play("ookh")



