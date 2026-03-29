extends Node
@export var enemy: PackedScene
@export var timer_time: int = 4
@export var timer_variance: int = 1


func _ready() -> void:
	reset_timer()

	
func reset_timer():
	$Timer.wait_time = timer_time + randf() * timer_variance * 2 - timer_variance
	$Timer.start()


func _on_timer_timeout() -> void:
	var prefab_obj = enemy.instantiate()
	add_child(prefab_obj);
	reset_timer()
