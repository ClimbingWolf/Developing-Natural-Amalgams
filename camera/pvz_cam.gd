extends Camera2D
@export var fighting_board: Node2D
@export var zoom_scale = 4;
var zoom_scalar;
var viewPort: SubViewport;
var scaling;
func _ready() -> void:
	viewPort = get_parent()
	viewPort.size = get_window().size
	viewPort.world_2d = viewPort.get_parent().get_viewport().world_2d
	zoom_scalar = get_window().size.x * zoom_scale / 1920
	global_position = Vector2(fighting_board.centerx, fighting_board.centery) + fighting_board.global_position;
	
func _process(delta: float) -> void:
	zoom = Vector2(1,1) * zoom_scalar

	
