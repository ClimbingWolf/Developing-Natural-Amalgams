extends Node2D

var tileSize = 9;

## Gets the coordinates of the selected cell of the map
func getMapCoords(layer: TileMapLayer) -> Vector2i:
	var local_mouse_pos = get_local_mouse_position();
	var cell = layer.local_to_map(local_mouse_pos);
	return cell

## Checks if the cell exists on a layer. Returns true if it exists, false otherwise
func checkExists(layer: TileMapLayer, cell: Vector2i):
	if (layer.get_cell_source_id(cell) == -1):
		return false;
	return true;
	
## Returns the Fighting Ground layer
func getFightingLayer() -> TileMapLayer:
	return get_node("FightingLayer")
	
func checkClick(layer: TileMapLayer) -> Vector2:
	var cell = getMapCoords(layer)
	
	if (!checkExists(layer, cell)): return Vector2.INF
	
	var loc = layer.map_to_local(cell) + Vector2(tileSize, tileSize);
	return loc
