extends Node

class_name creature
@export var defaultBody: PackedScene;
@export var defaultHead: PackedScene;
var body: Node2D
var head: Node2D

func _ready() -> void:
	if(defaultBody!=null && defaultHead != null):
		setupCreature(defaultBody.instantiate(), defaultHead.instantiate());
	

func setBody(newBody):
	if body:
		body.queue_free()
	body = newBody
	add_child(body)

func setHead(newHead):
	if head:
		head.queue_free()
	head = newHead
	add_child(head)

func setupCreature(newbody, newhead):
	setHead(newhead)
	setBody(newbody)
	head.global_position = body.get_node("HeadPos").global_position
	body.on_attatch(head)
	
func getBody():
	return body

func getHead():
	return head
