extends Node2D
class_name HotbarClass
var hover = false;
@export var hotbar_scale: int = 20;
static var currentHold: Node2D = Node2D.new(); #The object currently held by the mouse
static var currentHoldChecker = false #False if nothing is held, true otherwise

@export var hotbar: Node2D
@onready var map# = hotbar.map
@onready var fightingLayer# = map.getFightingLayer()

func _ready():
	map = hotbar.getMap()
	fightingLayer = map.getFightingLayer()
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
	#If the user is holding an Amalgam and presses escape or is hovering over the box and presses left click, return to the slot
	if(has_node("Amalgam") && currentHold == $Amalgam && ((Input.is_action_just_pressed("esc")) || (hover && Input.is_action_just_pressed("click")))):
		currentHold = Node2D.new();
		currentHoldChecker = false;
		position_amalgam();
	#If the mouse currently isn't holding anything and the slot is full, make the mouse hold the amalgam
	elif(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		currentHold = $Amalgam;
		currentHoldChecker = true
		
	#If the mouse is holding something and the slot is empty, place the amalgam in the new slot
	if(Input.is_action_just_pressed("click") && currentHoldChecker && !has_node("Amalgam") && hover && currentHold.name == "Amalgam"):
		var dupe = currentHold.duplicate()
		if verifyAmalgamPart(dupe):
			currentHoldChecker = false
			dupe.name = "Amalgam"
			currentHold.queue_free()
			#$Amalgam.queue_free();
			currentHold = Node2D.new();
			add_child(dupe);
			
	#Handling placing amalgamates (same code as factory_hotbar)
	var coords = map.checkClick(fightingLayer);
	#if(coords != Vector2.INF && ui.ui_state == "pvz"):
	if(coords != Vector2.INF):
		currentHold.global_position = coords;
		if(Input.is_action_just_pressed("click")):
			#map.add_child(currentHold);
			currentHold.global_position = coords;
			currentHold = currentHold.duplicate();
			#placements[coords] = currentHold
			map.add_child(currentHold);
			
			#Clear the current hold
			currentHold = Node2D.new()
			currentHoldChecker = false;
	
	if(has_node("Amalgam") && currentHoldChecker == false):
		position_amalgam()

#In child functions, checks to see if it is a head or a body
func verifyAmalgamPart(dupe) -> bool:
	return true

func position_amalgam():
	$Amalgam.global_position = global_position
	#This kinda hard coded rn because I couldn't get it to work here
	$Amalgam.scale = Vector2(.04,.04) * hotbar_scale#$HotbarSprite.texture.get_width()/$Amalgam.get_node("Body").get_node("Icon").texture.get_width()
		
