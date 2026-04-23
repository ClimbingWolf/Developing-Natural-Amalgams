extends Node2D

var active = false;
var speed = 5;
var layer = "bone";
var cost = 5

@onready var timer: Timer = $Timer
@onready var bone: Sprite2D = $Bone
@onready var skull: Sprite2D = $Skull

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	timer.wait_time = speed;
	
func _process(delta: float) -> void:
	if(active):
		if(timer.is_stopped()):
			timer.start()

func _on_timer_timeout() -> void:
	var areas = $Area2D.get_overlapping_areas();
	var conveyor: Node2D = null;
	#print(areas)
	for i: Area2D in areas:
		if(i.name == "ItemDetector"):
			conveyor = i.get_parent();
		if(i.is_in_group("ItemAreas")):
			conveyor = null;
			break;
	timer.wait_time = 0.1;
	
	if (conveyor != null && conveyor.active && conveyor.currentItem ==null):
		timer.wait_time = speed;
		var newBone: Node2D
		if(layer == "bone"):
			newBone = bone.duplicate();
		else:
			newBone = skull.duplicate();
		newBone.visible = true
		newBone.add_to_group("ItemAreas");
		conveyor.get_parent().add_child(newBone);
		conveyor.currentItem = newBone
		newBone.z_index = conveyor.z_index + 1
		newBone.position = conveyor.position
		newBone.active = true
		var boneArea:Area2D = newBone.get_node("Area2D")
		boneArea.monitorable = true;
	timer.start()
		
	
