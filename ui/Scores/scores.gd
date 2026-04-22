extends Node2D
class_name Scores
static var skulls = 0;
static var bones = 0;
static var gears = 0;
static var wave = 0;
func _ready() -> void:
	skulls = 0;
	bones = 0;
	gears = 10;
	wave = 0;

func _process(delta: float) -> void:
	$Skulls.text = "Skulls: " + str(skulls);
	$Bones.text = "Bones: " + str(bones);
	$Gears.text = "Gears: " + str(gears);
	$Wave.text = "Wave: " + str(wave);
