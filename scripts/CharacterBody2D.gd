extends CharacterBody2D

@export var hp = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	$Node2/ProgressBar.value = hp
	if hp <= 0:
		hide()

func get_damage():
	
	hp = hp - 10
	$AnimationPlayer.play("dam")
