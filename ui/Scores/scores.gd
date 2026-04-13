extends Node2D
class_name Scores
static var skulls = 0;
static var bones = 0;
func _ready() -> void:
	skulls = 0;
	bones = 0;

func _process(delta: float) -> void:
	$Skulls.text = "Skulls: " + str(skulls);
	$Bones.text = "Bones: " + str(bones);
