extends Area2D

func _on_area_entered(body):
	if body.is_in_group("player"):
		body.take_damage(1)
