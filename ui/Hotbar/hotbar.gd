extends Node2D

@export var UI: Node2D

func getMap():
	return UI.getMap()

func _process(delta: float) -> void:
	HotbarClass.currentHold.global_position = get_global_mouse_position()
