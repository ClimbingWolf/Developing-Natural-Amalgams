extends Node2D

var tileSize = 9;

## Gets the coordinates of the selected cell of the map
func getMapCoords(layer: TileMapLayer, pos: Vector2 = Vector2.INF) -> Vector2i:
	var local_mouse_pos
	if(pos == Vector2.INF):
		local_mouse_pos = get_local_mouse_position();
	else:
		local_mouse_pos = pos;
	
	var cell = layer.local_to_map(local_mouse_pos);
	return cell

## Checks if the cell exists on a layer. Returns true if it exists, false otherwise
func checkExists(layer: TileMapLayer, cell: Vector2i):
	if (layer.get_cell_source_id(cell) == -1):
		return false;
	return true;
	
func checkClick(layer: TileMapLayer, click: Vector2 = Vector2.INF) -> Vector2:
	var cell = getMapCoords(layer, click)
	
	if (!checkExists(layer, cell)): return Vector2.INF
	
	var loc = layer.map_to_local(cell) + Vector2(tileSize, tileSize);
	return loc
