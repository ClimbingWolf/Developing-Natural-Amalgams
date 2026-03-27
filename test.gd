extends Node2D

var cheetah_body = load("res://Amalgam/Scenes/cheetah_body.tscn")
var giraffe_head = load("res://Amalgam/Scenes/giraffe_head.tscn")

func _ready() -> void:
	$Creature.setupCreature(cheetah_body, giraffe_head)
