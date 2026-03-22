extends Node

class_name creature
@export var defaultBody: PackedScene;
@export var defaultHead: PackedScene;
var body: Amalgam_body
var head: Amalgam_head

func _ready() -> void:
	#this check sucks but it works as long as we don't add beggining children to the Creature nodes
	if(defaultBody!=null && defaultHead != null && body== null && head == null && len(get_children()) == 0):
		setupCreature(defaultBody.instantiate(), defaultHead.instantiate());
		add_child(body)
		add_child(head)
	

func setBody(newBody):
	if body:
		body.queue_free()
	body = newBody

func setHead(newHead):
	if head:
		head.queue_free()
	head = newHead

func setupCreature(newbody, newhead):
	setHead(newhead)
	setBody(newbody)
	head.global_position = body.get_node("HeadPos").global_position
	body.on_attatch(head)
	
func getBody():
	return body

func getHead():
	return head
