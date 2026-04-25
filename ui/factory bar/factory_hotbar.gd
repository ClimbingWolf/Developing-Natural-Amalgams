extends Node2D
class_name factory_hotbar

## Keeps track of the selected hotbar slot. Set to -1 if no spot selected.
var selection = -1;
## The node of the selected slot
var currentSpot: Node2D = null;
## The current held item
var currentHold: Node2D = null;
var selectionColor: Color = Color(0.59, 0.0, 0.0, 1.0);
var defaultColor: Color = Color(1.0, 1.0, 1.0, 1.0);
#var placements = {}
#static var mapScale = 3.125;

@onready var map = get_node("../../../Map")
@onready var desertLayer = map.get_node("DesertLayer")
@onready var boneLayer = map.get_node("BoneLayer")
@onready var skullLayer = map.get_node("SkullLayer")
	
func _process(delta: float) -> void:
	
	#If a number key is pressed (1-9) select/deselect that slot
	for i in range(9):
		if(Input.is_action_just_pressed(str(i + 1))):
			#Reset spot back to default color
			if (currentSpot != null): currentSpot.get_node("HotbarSprite").modulate = defaultColor;
			
			if(currentHold != null): #Remove the item currently being held
					currentHold.queue_free();
			
			if(i == selection): #If the slot is selected, deselect
				selection = -1;
				currentSpot = null;
			else: #If the slot is unselected, select
				selection = i;
				currentSpot = $"Hotbar nodes".get_child(selection);
					
				#Highlight the selected spot
				currentSpot.get_node("HotbarSprite").modulate = selectionColor;
				
				if(currentSpot.has_node("Piece")): #If a factory piece is in the hotbar, make it the held item
					var dupe = currentSpot.get_node("Piece").duplicate();
					map.add_child(dupe)
					currentHold = dupe;
					
					currentHold.modulate -= Color(0,0,0, 0.5);
				
	if(selection!= -1 && currentSpot!=null && currentSpot.has_node("Piece")):
		var coords
		if (currentHold.is_in_group("building")): #If the object can only be placed on fossils
			coords = map.checkClick(boneLayer);
			currentHold.layer = "bone";
			if(coords == Vector2.INF):
				coords =  map.checkClick(skullLayer);
				currentHold.layer = "skull";
			
		else:
			coords = map.checkClick(desertLayer);
			
		if(coords != Vector2.INF && ui.ui_state == "pvz"):
			currentHold.global_position = coords;
			if(Input.is_action_just_pressed("click")):
				
				#map.add_child(currentHold);
				currentHold.global_position = coords;
				currentHold.modulate += Color(0,0,0, 0.5);
				currentHold.active = true
				#selection = -1
				currentHold = currentHold.duplicate();
				#placements[coords] = currentHold
				map.add_child(currentHold);
				currentHold.modulate -= Color(0,0,0, 0.5);
				#currentSpot = null;
			if(Input.is_action_just_pressed("q")):
				currentHold.rotate(-PI/2);
			elif(Input.is_action_just_pressed("e")):
				currentHold.rotate(PI/2);
	
	
