extends Node2D
var full = false;
var canMove = true;
var conveyorSpeed = 1;
var targetOffset = Vector2(0, -16);
var item: Node2D = null;
var active = false;

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	if(has_node("Item")):
		full = true;
	
func _process(delta: float) -> void:
	if(active):
		var thisAreas = $ItemDetector.get_overlapping_areas();
		if(len(thisAreas)!= 0):
			for i:Area2D in thisAreas:
				if(i.is_in_group("ItemAreas") && i.get_parent().active):
					item = i.get_parent();
			
		canMove = true;
		var nextAreas  = $NextDetector.get_overlapping_areas();
		if(len(nextAreas) != 0):
			for i: Area2D in nextAreas:
				if(i.is_in_group("ItemAreas")):
					canMove = false;
		if(canMove && item!=null && !item.isMoving):
			canMove = false;
			item.isMoving = true;
			var tween = create_tween();
			tween.tween_property(item, "position", item.position + targetOffset.rotated(rotation), conveyorSpeed);
			await(tween).finished;
			tween.kill()
			if(item!=null):
				item.isMoving = false;
				canMove = true;
				item = null;
			
		
