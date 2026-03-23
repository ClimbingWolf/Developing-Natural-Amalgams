extends Node2D

var cheetah_body = load("res://Amalgam/Scenes/cheetah_body.tscn")
var giraffe_head = load("res://Amalgam/Scenes/giraffe_head.tscn")
var rhino_body = load("res://Amalgam/Scenes/rhino_body.tscn")
var creature: creature

func _ready() -> void:
	creature = $Creature
	creature.setupCreature(cheetah_body, giraffe_head)

func _on_cheetah_body_pressed() -> void:
	print("Previous speed: " + str(creature.getSpeed()))
	creature.setBody(cheetah_body)
	print("Cheetah speed: " + str(creature.getSpeed()))
	
func _on_giraffe_head_pressed() -> void:
	print("Previous range: " + str(creature.getRange()))
	creature.setHead(giraffe_head)
	print("Giraffe range: " + str(creature.getRange()))

func _on_rhino_head_pressed() -> void:
	print("Previous speed: " + str(creature.getSpeed()))
	print("Previous attack: " + str(creature.getAttack()))
	creature.setBody(rhino_body)
	print("Rhino speed: " + str(creature.getSpeed()))
	print("Rhino attack: " + str(creature.getAttack()))
