#extends Node2D
#@export var board_width: int = 8;
#@export var board_height: int = 5;
#@export var tile_sprite_prefab: PackedScene;
#@export var color1: Color = Color(0.354, 0.362, 0.089, 1.0);
#@export var color2: Color = Color(0.238, 0.333, 0.054, 1.0);
#@export var pixel_tile_width: int = 50;
#@export var pixel_tile_height: int = 50;
#var centerx = (board_width/2-0.5)*pixel_tile_height;
#var centery = (board_height/2-0.5)*pixel_tile_width;
#
#
#var tiles = []
#
#func _ready() -> void:
	#var tile_sprite_node: Node2D = tile_sprite_prefab.instantiate()
	#var tile_sprite = tile_sprite_node.get_node("Sprite2D")
	#var tile_size = tile_sprite.get_rect().size
	#tile_sprite_node.scale = Vector2(pixel_tile_width, pixel_tile_height)/tile_size
	#tile_size = tile_sprite.get_rect().size * tile_sprite_node.scale
	#var inner = [];
	#for i in range(board_width):
		#inner.append([])
		#for j in range(board_height):
			#var inst: Node2D = tile_sprite_node.duplicate();
			#inst.name = "BoardTile(" + str(i) + "," + str(j) + ")"
			#add_child(inst);
			#inst.position = Vector2(i * tile_size.x, j *tile_size.y)
			#inner[i].append(inst);
			#if((i+j)%2 ==0 ):
				#inst.get_node("Sprite2D").modulate= color1
			#else:
				#inst.get_node("Sprite2D").modulate = color2
#
			#
