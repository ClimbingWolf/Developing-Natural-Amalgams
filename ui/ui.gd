extends Node2D
@export var cameraViewport: SubViewport
@export var dupe_script: Script
var minimap_moving = false;
var minimap_speed = 20;
var startPos: Vector2;
var endPos: Vector2;
var startScale: Vector2;
var endScale: Vector2;
var rect: TextureRect;
var mainCam: Camera2D
var dupe_cam: Camera2D;
var margin_of_err: Vector2 = Vector2(0.1,0.1);
func _ready() -> void:
	mainCam = get_viewport().get_camera_2d();
	pass
	rect = $CanvasLayer/TextureRect
	rect.pivot_offset = rect.size/2
	rect.texture = cameraViewport.get_texture();
	startPos = rect.global_position;
	endPos = get_window().size/2;
	startScale =  rect.size;
func _process(delta: float) -> void:
	endScale = get_viewport_rect().size
	if(Input.is_action_just_pressed("space")):
		minimap_moving = !minimap_moving
	if(minimap_moving):
		rect.size = lerp(rect.size, endScale, minimap_speed*delta);
		rect.global_position = lerp(rect.global_position, endPos - rect.size/2, minimap_speed*delta)
		if(rect.size <= endScale + margin_of_err and rect.size >= endScale - margin_of_err):
			dupe_cam = cameraViewport.get_camera_2d().duplicate();
			dupe_cam.set_script(dupe_script)
			dupe_cam.fighting_board = get_parent().get_node("FightingBoard")
			add_child(dupe_cam)
			dupe_cam.make_current()
			rect.visible = false
	else:
		rect.visible = true
		if(dupe_cam == null || dupe_cam.is_current()):
			mainCam.make_current()
			if(dupe_cam!=null):
				dupe_cam.queue_free()
			
		rect.size = lerp(rect.size, startScale, minimap_speed*delta);
		rect.global_position = lerp(rect.global_position, startPos, minimap_speed*delta)

		
