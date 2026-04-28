extends Camera2D
#i just set up wasd now bc it was easier to set up
@export var wasd_speed = 1000
@export var zoom_scale = 1.05;
@export var min_zoom = 1
@export var max_zoom = 10;
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	if(is_current()):
		var mult = delta*wasd_speed* 1/zoom.x
		var last_pos = position;
		if(Input.is_action_pressed("up") && position.y > limit_top):
			translate(Vector2.UP * mult)
		if(Input.is_action_pressed("down") && position.y < limit_bottom):
			translate(Vector2.DOWN * mult)
		if(Input.is_action_pressed("left") && position.x > limit_left):
			translate(Vector2.LEFT * mult)
		if(Input.is_action_pressed("right") && position.x < limit_right):
			translate(Vector2.RIGHT * mult)
			
		
func _input(event):
	var last_zoom = zoom;
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom /= Vector2(1,1) * zoom_scale
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= Vector2(1,1) * zoom_scale
		if(zoom.x < min_zoom):
			zoom = Vector2(1,1) * min_zoom
		elif(zoom.x > max_zoom):
			zoom = Vector2(1,1) * max_zoom
		
