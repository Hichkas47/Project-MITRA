extends CharacterBody2D
var gravity=300




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("new_animation")


func _physics_process(delta):
	self.position.y+=(gravity*delta)
	
