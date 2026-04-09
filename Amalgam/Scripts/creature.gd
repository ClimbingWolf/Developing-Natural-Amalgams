extends Node
class_name creature
@export var defaultBody: PackedScene;
@export var defaultHead: PackedScene;
var body: Amalgam_body
var head: Amalgam_head
@export var hp:int =10
var attack:int =10
var defense:int=10
var speed:float=10
var range:float=10
func _ready() -> void:
	$TextureProgressBar.value = hp
	
	
	#if(!has_node("Body") && !has_node("Head")):
		#setupCreature(defaultBody.instantiate(), defaultHead.instantiate());
		#add_child(body)
		##add_child(head)
	

func setBody(newBody):
	if body:
		body.queue_free()
	body = newBody
	add_child(body)

func setHead(newHead):
	if head:
		head.queue_free()

	head = newHead.duplicate();
	
	add_child(head)
	
	hp = head.hp
	attack = head.attack
	defense = head.defense
	speed = head.speed
	range = head.range
	
func setupCreature(newbody, newhead):
	setBody(newbody)
	setHead(newhead)
	var head_offset = head.get_node("BodyPos").global_position
	var body_offset = body.get_node("HeadPos").global_position
	head.position = body_offset-head_offset 
	
	body.on_attatch(head)

	attack = attack * body.atk_mult
	hp = hp * body.hp_mult
	speed = speed * body.spd_mult

func getBody():
	return body

func getHead():
	return head


#Do we still need thses?
func getAttack() -> float:
	return head.attack * body.atk_mult

func getSpeed() -> float:
	return head.speed * body.spd_mult

func getRange() -> float:
	return head.range * body.range_mult
	
func takeDamage(damage):
	var newDamage = damage/ (defense/10)
	hp -= newDamage
	$TextureProgressBar.value = hp
	if(hp <= 0):
		queue_free();
	
	pass

func doAttack():
	
	head.doAttack()
