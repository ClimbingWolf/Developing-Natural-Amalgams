extends Node2D
class_name ui;
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
static var ui_state = "pvz";
var hotbar_end_y = -200;
var hotbar_start_y =50;
var deletor_start_y = 64;
var deletor_end_y = -300;
var factory_hotbar_end = 700;
var factory_hotbar_start = 350;

@export var speed = 3;
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
	if(Input.is_action_just_pressed("space")):
		minimap_moving = !minimap_moving
		if(ui_state == "pvz"):
			visible = false;
			ui_state = "factory"
		else:
			visible = true
			ui_state = "pvz";
	minimap_control(delta)
	update_hotbar_pos(delta)
	if(ui_state == "pvz"):
		pvz_loop(delta);
	if (Input.is_action_just_pressed("Tab")):
		$"CanvasLayer/Crafting Menu".visible = !$"CanvasLayer/Crafting Menu".visible
	
func pvz_loop(delta : float) -> void:
	pass

func minimap_control(delta: float) -> void:
	endScale = get_viewport_rect().size

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
		
func update_hotbar_pos(delta):

	if(ui_state == "factory"):
		$CanvasLayer/Hotbar.position = lerp($CanvasLayer/Hotbar.position, Vector2(0, hotbar_start_y), delta * speed);
		$CanvasLayer/Deletor.position = lerp(Vector2($CanvasLayer/Deletor.position.x, deletor_start_y), $CanvasLayer/Deletor.position, delta * speed);
		$CanvasLayer/FactoryHotbar.position = lerp($CanvasLayer/FactoryHotbar.position, Vector2(0, factory_hotbar_end), delta * speed);

	else:
		$CanvasLayer/Hotbar.position = lerp($CanvasLayer/Hotbar.position, Vector2(0, hotbar_end_y), delta * speed);
		$CanvasLayer/Deletor.position = lerp($CanvasLayer/Deletor.position, Vector2($CanvasLayer/Deletor.position.x, deletor_end_y), delta * speed);
		$CanvasLayer/FactoryHotbar.position = lerp($CanvasLayer/FactoryHotbar.position, Vector2(0, factory_hotbar_start), delta * speed);
		
		
