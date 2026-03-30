extends Node2D

var hover = false

@export var scale_on_tile: int = 20

func _ready():
	var size = $Sprite2D.texture.get_size() * scale
	
func _on_area_2d_mouse_entered() -> void:
	$Sprite2D.modulate += Color(0.1, 0.1, 0.1)
	hover = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	$Sprite2D.modulate -= Color(0.1, 0.1, 0.1)
	hover = false
	pass # Replace with function body.

func _process(delta: float) -> void:
	if(hover && HotbarClass.currentHoldChecker && !has_node("Amalgam") && Input.is_action_just_pressed("click") && HotbarClass.currentHold.name == "Amalgam"):
		var dupe = HotbarClass.currentHold.duplicate()
		HotbarClass.currentHoldChecker =false
		dupe.name = "Amalgam"
		add_child(dupe)
		dupe.get_node("Area2D").process_mode = Node.PROCESS_MODE_INHERIT
		dupe.scale = Vector2(1,1) * scale_on_tile
		HotbarClass.currentHold.queue_free()
		HotbarClass.currentHold = Node2D.new()
	if(has_node("Amalgam") && HotbarClass.currentHoldChecker == false):
		$Amalgam.global_position = global_position
	if(Input.is_action_just_pressed("click") && HotbarClass.currentHoldChecker && has_node("Amalgam") && HotbarClass.currentHold.name == "Deletor" && hover):
		remove_child($Amalgam);
		HotbarClass.currentHold = Node2D.new();
		HotbarClass.currentHoldChecker = false;
		
