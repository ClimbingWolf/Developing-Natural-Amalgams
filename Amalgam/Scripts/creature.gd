extends Node

class_name creature
var body: Node
var head: Node

#Sets the body by giving it a scene
func setBody(newBody: PackedScene):
	if body:
		body.queue_free()
	body = newBody.instantiate() 
	add_child(body) #Needs to be here otherwise _ready won't run

#Sets the head by giving it a scene
func setHead(newHead: PackedScene):
	if head:
		head.queue_free()
	head = newHead.instantiate()
	add_child(head)
	head.global_position = body.get_node("HeadPos").global_position

func setupCreature(newbody: PackedScene, newhead: PackedScene):
	setBody(newbody)
	setHead(newhead)
	
func getBody():
	return body

func getHead():
	return head

func getAttack() -> float:
	return head.attack * body.atk_mult

func getSpeed() -> float:
	return head.speed * body.spd_mult

func getRange() -> float:
	return head.range * body.range_mult
