extends CharacterBody2D

var player = get_tree().get_root().get_node("main/player")

@export var active = 1
@export var hp = 7
@export var speed = 100

var dist
var dir 

func _ready():
	randomize()

func _process(delta):
	if not hp:
		queue_free()
	dir = (player.position - position).normalized()
	dist = player.position.distance_to(position)
	if dist > 50:
		$enemy.position += dir * speed * delta

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		hp -= 1
		$AnimationPlayer.play("ookh")



