extends Node

class_name Amalgam_body

@export var atk_mult: float = 1.0
@export var hp_mult: float = 1.0

func attatch_head(head):
	$Head.add_child(head)
	on_attatch(head)
	pass

func on_attatch(head):
	pass
