extends Node2D

@export var speed: float = 1
@export var capacity: int = 10
var resource:PackedScene

var amountStored = 0

func _ready() -> void:
	print("Hi im drill")
	$Timer.wait_time = speed
	$Timer.start()
	pass
	
func drill():
	if amountStored < capacity:
		amountStored += 1
		print("stored " + str(amountStored))
	$Timer.start()


func _on_timer_timeout() -> void:
	drill()

#function to detect what to gather

#function to detect conveyor belt and send it away.
