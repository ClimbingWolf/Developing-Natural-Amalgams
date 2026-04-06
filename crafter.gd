extends Node2D

var speed: float = 5
var requiredAmount: int = 1
#resource name

var amountStored: int = 0
var amountOutput:int = 0

func _ready() -> void:
	$Timer.wait_time = speed
	$Timer.start()


func craft():
	if requiredAmount < amountStored:
		amountStored -= requiredAmount
		amountOutput += 1

func _on_timer_timeout() -> void:
	craft()

#function to collect items from incoming conveyor

#function to output items to outcoming conveyor


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		$UI.showMenu()
