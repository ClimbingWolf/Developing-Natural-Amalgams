extends Node2D

var boneLayer: TileMapLayer;
var desertLayer: TileMapLayer
func _ready() -> void:
	boneLayer =  $BoneLayer
	desertLayer = $DesertLayer
func checkClick() -> Vector2:
	
	var local_mouse_pos = get_local_mouse_position();
	var cell = desertLayer.local_to_map(local_mouse_pos);
	var loc = desertLayer.map_to_local(cell);
	
	var world = to_global(loc);
	return loc;
	
		
	
	
	
	
