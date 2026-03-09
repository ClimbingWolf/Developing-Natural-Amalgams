extends Sprite2D

func _ready():
	var size = texture.get_size() * scale
	
func _on_area_2d_mouse_entered() -> void:
	modulate += Color(0.1, 0.1, 0.1)
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	modulate -= Color(0.1, 0.1, 0.1)
	pass # Replace with function body.
