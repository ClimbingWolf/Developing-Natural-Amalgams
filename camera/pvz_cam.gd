extends Camera2D
@export var zoom_scale = 4;
var zoom_scalar;
var viewPort: SubViewport;
var scaling;

@onready var fighting_board: TileMapLayer = get_node("../../Map").getFightingLayer()

func _ready() -> void:
	viewPort = get_parent()
	viewPort.size = get_window().size
	viewPort.world_2d = viewPort.get_parent().get_viewport().world_2d
	zoom_scalar = get_window().size.x * zoom_scale / 1920
	global_position = fighting_board.position + fighting_board.global_position;
	
func _process(delta: float) -> void:
	zoom = Vector2(1,1) * zoom_scalar

	
