extends Node2D
func _process(delta: float) -> void:
	HotbarClass.currentHold.global_position = get_global_mouse_position()
