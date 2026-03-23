extends Node2D
var hover = false;
var update = false;
func _process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("click") && !HotbarClass.currentHoldChecker && hover && !update):
		HotbarClass.currentHold = $Deletor
		HotbarClass.currentHoldChecker = true
		update = true
	if(Input.is_action_just_pressed("click") && HotbarClass.currentHoldChecker && HotbarClass.currentHold.name == "Deletor" && hover && !update):
		HotbarClass.currentHold = Node2D.new();
		HotbarClass.currentHoldChecker = false;
		update = true
	update = false;
	if(HotbarClass.currentHold.name == ""):
		$Deletor.global_position = global_position

func _on_area_2d_mouse_entered() -> void:
	modulate += Color(0.1, 0.1, 0.1)
	hover = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	modulate -= Color(0.1, 0.1, 0.1)
	hover = false
	pass # Replace with function body.
