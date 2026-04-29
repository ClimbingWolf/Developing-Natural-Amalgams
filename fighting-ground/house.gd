extends Area2D

@export var deathScreen: CanvasLayer 
@export var enemySpawner: Node2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		Scores.health -= 1
		if Scores.health <= 0:
			var zero = 0
			deathScreen.visible = true
			enemySpawner.active = false
			pass 
		area.get_parent().queue_free();
	pass 
