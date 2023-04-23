extends CharacterBody2D

@export var hp = 7
@export var active = 1
@export var speed = 150

var player
var dir
var dist
var c = 10
var move = 1
var srand = 1
var frame = 0
var chase = 0
var rev_dir

func _ready():
	randomize()
	player = get_node("/root/main/player")
	
func _process(delta):
	if not hp:
		hide()
	dir = (player.position - position).normalized()
	dist = player.position.distance_to(position)
	if srand:
		frame = randi() % 60 + 1
		if frame > 30:
			chase = 1
			rev_dir = 1
		else:
			chase = 0
		if frame <= 40:
			rev_dir = -1
		srand = 0
	if chase:
		var diff = dir * speed * delta * rev_dir
		if dist > 100 and move:
			position += diff
		else:
			move = 0
			position.x += 5
			c -= 1
			if not c:
				move = 1
				c = 5
		frame -= 1
		if frame == 0:
			srand = 1
	else:
		frame -= 1
		if frame == 0:
			srand = 1

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		hp -= 1
		$AnimationPlayer.play("ookh")



