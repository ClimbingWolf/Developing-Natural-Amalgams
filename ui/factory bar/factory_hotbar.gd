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
var placements = {}
var startPoint: Vector2 = Vector2.ZERO;
var endPoint: Vector2 = Vector2.ZERO;
var startCoords: Vector2 = Vector2.ZERO;

#static var mapScale = 3.125;

@onready var map = get_node("../../../Map")
@onready var desertLayer: TileMapLayer = map.get_node("DesertLayer")
@onready var boneLayer = map.get_node("BoneLayer")
@onready var skullLayer = map.get_node("SkullLayer")

func _ready() -> void:
	
	for i in range(9):
		var spot: Node2D = $"Hotbar nodes".get_child(i);
		if(spot.has_node("Piece")):
			spot.tile_cost = spot.get_node("Piece").cost;
	
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
			#We need a better dragging implementation, but this works.
			if(Input.is_action_pressed("click") && placements.keys().find(coords) == -1 && Scores.gears >= currentHold.cost && !currentHold.is_in_group("Delete")):
				#map.add_child(currentHold);
				
				currentHold.global_position = coords;
				currentHold.modulate += Color(0,0,0, 0.5);
				currentHold.active = true
				#selection = -1
				currentHold = currentHold.duplicate();
				placements[coords] = currentHold
				map.add_child(currentHold);
				currentHold.modulate -= Color(0,0,0, 0.5);
				Scores.gears -= currentHold.cost
			elif (Input.is_action_pressed("click") && placements.keys().find(coords) != -1 && currentHold.is_in_group("Delete")):
				print("evil")
				var area2d: Area2D = currentHold.get_node("Area2D");
				var areas = area2d.get_overlapping_areas();
				for i in areas:
					if(i.get_parent() in map.get_children() && !i.is_in_group("NextDetector")):
						Scores.gears += i.get_parent().cost;
						i.get_parent().queue_free();
				placements.erase(coords);
			#Working on dragging conveyors, doesn't work yet
			#if(Input.is_action_just_pressed("click") && placements.keys().find(coords) == -1 && currentHold.is_in_group("Conveyor")):
				#startPoint = get_global_mouse_position();
				#startCoords = map.checkClick(desertLayer, get_global_mouse_position());
			#if(Input.is_action_pressed("click") && placements.keys().find(coords) == -1 && currentHold.is_in_group("Conveyor")):
				#print(startPoint-endPoint)
				#endPoint = get_global_mouse_position();
				#var endCoords = map.checkClick(desertLayer, get_global_mouse_position())
				#if(rotation_degrees == 0 || rotation_degrees == 180):
					#var child_x_offset = 0;
					#while(abs(child_x_offset) < abs(startCoords.x - endCoords.x)):
						#if(startCoords.x < endCoords.x):
							#child_x_offset += desertLayer.map_to_local(desertLayer.local_to_map(endCoords) + Vector2i(1,0)).x;
						#else:
							#child_x_offset -= desertLayer.map_to_local(desertLayer.local_to_map(endCoords) + Vector2i(1,0)).x;
						#var child = currentHold.duplicate();
						#child.position.x += child_x_offset;
						#currentHold.add_child(child);
					
			if(Input.is_action_just_pressed("q")):
				currentHold.rotate(PI/2);
			elif(Input.is_action_just_pressed("e")):
				currentHold.rotate(-PI/2);
	
	
