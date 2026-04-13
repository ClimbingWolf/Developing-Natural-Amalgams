extends Sprite2D
var active = false;
var speed = 5;
var bone;
var timer: Timer;
func _ready() -> void:
	timer = $Timer
	bone = $Bone
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
	timer.wait_time = speed;
	timer.start()
	if (conveyor != null):
		var newBone: Node2D = bone.duplicate();
		newBone.visible = true
		newBone.add_to_group("ItemAreas");
		conveyor.get_parent().add_child(newBone);
		newBone.z_index = conveyor.z_index + 1
		newBone.position = conveyor.position
		newBone.active = true
		var boneArea:Area2D = newBone.get_node("Area2D")
		boneArea.monitorable = true;
		
		
	
