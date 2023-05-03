extends Control

func _on_main_credit():
	$credit_holder.linear_velocity = Vector2(0, -70)
	await get_tree().create_timer(3).timeout
	$credit_holder.linear_velocity = Vector2(0, -80)
	await get_tree().create_timer(3).timeout
	$credit_holder.linear_velocity = Vector2(0, -80)
	await get_tree().create_timer(3).timeout
	$credit_holder.linear_velocity = Vector2(0, -80)
