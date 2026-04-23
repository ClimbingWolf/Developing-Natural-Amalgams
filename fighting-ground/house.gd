extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		print("YOU TOOK DAMAGE")
		Scores.health -= 1
		if Scores.health <= 0:
			var zero = 0
			var crash = 1/zero
			pass 
	pass 
