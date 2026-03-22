extends Node2D

var cheetah_body = load("res://Amalgam/Scenes/cheetah_body.tscn")
var giraffe_head = load("res://Amalgam/Scenes/giraffe_head.tscn")
var creature: creature

func _ready() -> void:
	creature = $Creature
	creature.setupCreature(cheetah_body, giraffe_head)

func _on_cheetah_body_pressed() -> void:
	print("Previous speed: " + str(creature.getSpeed()))
	creature.setBody(cheetah_body)
	print("Cheetah speed: " + str(creature.getSpeed()))
	pass # Replace with function body.
	
func _on_giraffe_head_pressed() -> void:
	pass # Replace with function body.
