extends Node2D

var boneLayer: TileMapLayer;
var desertLayer: TileMapLayer
var tileSize = 9;

func _ready() -> void:
	boneLayer =  $BoneLayer
	desertLayer = $DesertLayer
func checkClickDesert() -> Vector2:
	
	var local_mouse_pos = get_local_mouse_position();
	var cell = desertLayer.local_to_map(local_mouse_pos);
	if($DesertLayer.get_cell_source_id(cell) == -1):
		return Vector2.INF;
	var loc = desertLayer.map_to_local(cell) + Vector2(tileSize, tileSize);
	
	var world = to_global(loc);
	
	return loc;
	
		
func checkClickBone() -> Vector2:
	
	var local_mouse_pos = get_local_mouse_position();
	var cell = boneLayer.local_to_map(local_mouse_pos);
	var loc = boneLayer.map_to_local(cell) + Vector2(tileSize, tileSize);
	if($BoneLayer.get_cell_source_id(cell) == -1):
		return Vector2.INF;
	var world = to_global(loc);
	return loc;
	
	
	
	
