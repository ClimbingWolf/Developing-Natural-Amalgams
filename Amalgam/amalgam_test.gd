extends Node2D

var cheetah = load("res://Amalgam/cheetah_body.tscn")
var giraffe = load("res://Amalgam/giraffe_head.tscn")
var currentBody
var currentHead

func _ready() -> void:
	var body = cheetah.instantiate()
	$Creature.add_child.call_deferred(body)
	body.global_position = Vector2(500, 500)
	var head = giraffe.instantiate()
	body.get_node("Head").add_child.call_deferred(head)
	head.global_position = body.get_node("HeadPos").global_position
	currentBody = body
	currentHead = head

func _on_cheetah_pressed() -> void:
	print(currentHead.speed)
	currentBody.on_attatch(currentHead)
	print(currentHead.speed)
	pass # Replace with function body.


func _on_tardigrade_pressed() -> void:
	pass # Replace with function body.


func _on_rhino_pressed() -> void:
	pass # Replace with function body.
