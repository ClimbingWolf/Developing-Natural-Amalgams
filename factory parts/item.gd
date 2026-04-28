extends Sprite2D
var isMoving = false;
var active = false;
var cost = 0;
@export var itemName = "bone";
var currentTween: Tween;

func _process(delta: float) -> void:
	if(currentTween !=null):
		await currentTween.finished
		isMoving = false;
