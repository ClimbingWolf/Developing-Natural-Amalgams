extends Node2D
class_name HotbarClass
var hover = false;
var hotbar:Node;
static var currentHold: Node2D = Node2D.new();
static var currentHoldChecker = false

func _ready():
	hotbar = get_parent().get_parent();
	hover = false
	$HotbarSprite.modulate = Color(0.0, 0.525, 0.0, 1.0)
	
func _on_area_2d_mouse_entered() -> void:
	modulate += Color(0.1, 0.1, 0.1)
	hover = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	modulate -= Color(0.1, 0.1, 0.1)
	hover = false
	pass # Replace with function body.

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover):
		currentHold = $Amalgam;
		currentHoldChecker= true
	if(Input.is_action_just_pressed("click") && currentHoldChecker && !has_node("Amalgam") && hover):
		var dupe = currentHold.duplicate()
		currentHoldChecker =false
		dupe.name = "Amalgam"

		add_child(dupe)
		currentHold.queue_free()
		currentHold = Node2D.new();;
	if(has_node("Amalgam") && currentHoldChecker == false):
		$Amalgam.global_position = global_position
		#This kinda hard coded rn because I couldn't get it to work here
		$Amalgam.scale = Vector2(.1,.1) * $HotbarSprite.texture.get_width()/$Amalgam.get_node("Body").get_node("Icon").texture.get_width()
		
	
		
		
