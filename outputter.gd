extends Node2D

var active = false
var item = null
func _process(delta: float) -> void:
	if(active):
		var areaDetect = $Area2D.get_overlapping_areas();
		if (len(areaDetect) != 0):
			for i:Area2D in areaDetect:
				if(i.is_in_group("ItemAreas") && i.get_parent().active):
					item = i.get_parent();
			if item.itemName == "bone":
				Scores.bones += 1
			elif item.itemName == "skull":
				Scores.skulls += 1
