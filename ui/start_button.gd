extends Button


func _on_button_down() -> void:
	SpawnController.hasStarted = true;
	queue_free();
