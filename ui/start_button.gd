extends Button

func _process(delta: float) -> void:
	if SpawnController.time_left > 30:
		visible = false
	else:
		visible = true

func _on_button_down() -> void:
	SpawnController.skip = true;
