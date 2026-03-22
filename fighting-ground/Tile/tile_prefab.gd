extends Node2D

var hover = false

func _ready():
	var size = $Sprite2D.texture.get_size() * scale
	
func _on_area_2d_mouse_entered() -> void:
	print("yoink")
	$Sprite2D.modulate += Color(0.1, 0.1, 0.1)
	hover = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	$Sprite2D.modulate -= Color(0.1, 0.1, 0.1)
	hover = false
	pass # Replace with function body.

func _process(delta: float) -> void:
	if(hover && HotbarClass.currentHoldChecker && !has_node("Amalgam") && Input.is_action_just_pressed("click")):
		var dupe = HotbarClass.currentHold.duplicate()
		HotbarClass.currentHoldChecker =false
		dupe.name = "Amalgam"
		add_child(dupe)
		dupe.scale = Vector2(1,1) * $Sprite2D.texture.get_width()/dupe.get_node("Body").get_node("Icon").texture.get_width()
		HotbarClass.currentHold.queue_free()
		HotbarClass.currentHold = Node2D.new();;
	if(has_node("Amalgam") && HotbarClass.currentHoldChecker == false):
		$Amalgam.global_position = global_position
		
