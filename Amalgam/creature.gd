extends Node

class_name creature
var body
var head

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
