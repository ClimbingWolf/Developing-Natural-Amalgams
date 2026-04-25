extends Node2D
class_name Scores
static var skulls = 10;
static var bones = 10;

func _process(delta: float) -> void:
	$Skulls.text = "Skulls: " + str(skulls);
	$Bones.text = "Bones: " + str(bones);
