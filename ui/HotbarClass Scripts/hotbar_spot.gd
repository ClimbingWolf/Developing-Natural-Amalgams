extends Node2D
class_name HotbarClass
var hover = false;
var hotbar:Node;
@export var hotbar_scale: int = 20;
static var currentHold: Node2D = Node2D.new(); #The object currently held by the mouse
static var currentHoldChecker = false #False if nothing is held, true otherwise

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
	#If the mouse currently isn't holding anything and the slot is full
	if(has_node("Amalgam") && currentHold == $Amalgam && ((Input.is_action_just_pressed("esc")) || (hover && Input.is_action_just_pressed("click")))):
		currentHold = Node2D.new();
		currentHoldChecker = false;
		position_amalgam();
	elif(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		currentHold = $Amalgam;
		currentHoldChecker = true

	
		
	#If the mouse is holding something and the slot is empty
	if(Input.is_action_just_pressed("click") && currentHoldChecker && !has_node("Amalgam") && hover && currentHold.name == "Amalgam"):
		var dupe = currentHold.duplicate()
		if verifyAmalgamPart(dupe):
			currentHoldChecker = false
			dupe.name = "Amalgam"
			currentHold.queue_free()
			#$Amalgam.queue_free();
			currentHold = Node2D.new();
			add_child(dupe);

	if(has_node("Amalgam") && currentHoldChecker == false):
		#print($Amalgam)
		position_amalgam()

#In child functions, checks to see if it is a head or a body
func verifyAmalgamPart(dupe) -> bool:
	return true

func position_amalgam():
	$Amalgam.global_position = global_position
	#This kinda hard coded rn because I couldn't get it to work here
	$Amalgam.scale = Vector2(.1,.1) * hotbar_scale#$HotbarSprite.texture.get_width()/$Amalgam.get_node("Body").get_node("Icon").texture.get_width()
		
