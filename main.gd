extends Node2D

var enemy_scene = load("res://enemy.tscn")
var enemy_inst

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func spawn_enemy():
	enemy_inst = enemy_scene.instantiate()
	add_child(enemy_inst)
	enemy_inst.position = Vector2(1152, (randi() % 9) * 70)
	enemy_inst.scale = Vector2(0.25, 0.25)

func _on_enemy_spawn_timer_timeout():
	await get_tree().create_timer(randi() % 2).timeout
	spawn_enemy()


