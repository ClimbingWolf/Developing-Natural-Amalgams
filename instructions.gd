extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("h"):
		visible = !visible

func _on_button_pressed() -> void:
	visible = false
	pass # Replace with function body.
