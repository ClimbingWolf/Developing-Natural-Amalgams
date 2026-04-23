extends Label

func _process(delta: float) -> void:
	text = "next wave: " + str(SpawnController.time_left)
