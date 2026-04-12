extends Node2D
var selection = -1;
var currentSlot: Node2D = null;
var selectionColor: Color = Color(0.59, 0.0, 0.0, 1.0);
var defaultColor: Color = Color(1.0, 1.0, 1.0, 1.0);
var epic_slot = null;
var last_slot: Node2D = null;
var currentHold: Node2D;
var map: Node2D;



func _ready() -> void:
	map = get_parent().get_parent().get_parent().get_node("Map")
func _process(delta: float) -> void:
	if(selection != -1):
		currentSlot = $"Hotbar nodes".get_child(selection);
	for i in range(9):
		if(Input.is_action_just_pressed(str(i + 1))):
			if(i == selection):
				selection = -1;
				currentSlot = null;
			else:
				selection = i;
	if(currentSlot!=last_slot):
		if(currentHold != null):
			currentHold.queue_free();
		if(currentSlot != null):
			currentSlot.get_node("HotbarSprite").modulate = selectionColor;
			if(currentSlot.has_node("Piece")):
				var dupe = currentSlot.get_node("Piece").duplicate();
				map.add_child(dupe)
				currentHold = dupe;
				
				currentHold.modulate -= Color(0,0,0, 0.5);
		for i in range(9):
			epic_slot = $"Hotbar nodes".get_child(i);1
			if(currentSlot != epic_slot):
				epic_slot.get_node("HotbarSprite").modulate = defaultColor;
	last_slot = currentSlot
	if(selection!= -1 && currentSlot!=null && currentSlot.has_node("Piece")):
		var coords = map.checkClick();
		if(coords != null):
			currentHold.global_position = coords;
			if(Input.is_action_just_pressed("click")):
				#map.add_child(currentHold);
				currentHold.global_position = coords;
				selection = -1
				currentHold = null;
				currentSlot = null;
			
			
		
		
	
