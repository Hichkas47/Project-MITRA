extends CharacterBody2D

@export var hp = 100
@export var active = 1
@export var speed = 150
@export var is_facing = 0
var state_machine
var player
var dir
var dist
var c = 10
var srand = 1
var frame = 0
var chase = 0
var rev_dir

func _ready():
	randomize()
	state_machine = $AnimationTree.get("parameters/playback")
	player = get_node("/root/main/player")
	
func _process(delta):
	if not hp:
		hide()
		
	dir = (player.position - position).normalized()
	dist = player.position.distance_to(position)
	if srand:
		idle()
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
		print(diff)
		if dist > 145:
			walk()
			position += diff
		else:
			diff.x = 0
			diff.y = (self.position.y - player.position.y) * - 0.5
			position += diff
		frame -= 1
		if frame == 0:
			srand = 1
	else:
		frame -= 1
		if frame == 0:
			srand = 1
#	faceoutsidethedis()
#	instead
	if dist > 145 and player.position.x < self.position.x:
		if rev_dir == 1:
			$poser.play("facingb")
		else:
			$poser.play("facings")
	elif dist > 145 and player.position.x > self.position.x:
		if rev_dir == -1:
			$poser.play("facingb")
		else:
			$poser.play("facings")
	#end
	if dist < 145:
		var	pframe = randi() % 90 + 1
		if pframe == 5:
			punch()
		else:
			idle()
		facing()
		chase = 0
#		srand = 0
func walk():
	state_machine.travel("walking")
func idle():
	state_machine.travel("idle")
func punch():
	state_machine.travel("punching")
	
func faceoutsidethedis():
#	if dist > 145 and player.position.x < self.position.x:
#		if rev_dir == 1:
#			$poser.play("facingb")
#		else:
#			$poser.play("facings")
#	elif dist > 145 and player.position.x > self.position.x:
#		if rev_dir == -1:
#			$poser.play("facingb")
#		else:
#			$poser.play("facings")
	pass
func facing():
	is_facing = 1
	if player.position.x < self.position.x:
		$poser.play("facingb")
	else:
		$poser.play("facings")

func _on_area_body_entered(body):
	if body.is_in_group("fist"):
		hp -= 1
		state_machine.travel("ookh")



func _on_area_1_body_entered(body):
	if body.is_in_group("player"):
		body.get_damage()


#func _on_area_body_exited(body):
#	if body.is_in_group("fist"):
#		hp -= 1
#		state_machine.travel("ookh")
