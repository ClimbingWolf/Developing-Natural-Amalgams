extends Node
class_name creature
@export var defaultBody: PackedScene;
@export var defaultHead: PackedScene;
var body: Amalgam_body
var head: Amalgam_head
var hp:int
var attack:int
var defense:int
var speed:float
var range:float
func _ready() -> void:
	#this check sucks but it works as long as we don't add beggining children to the Creature nodes
	if(defaultBody!=null && defaultHead != null && body== null && head == null && len(get_children()) == 0):
		setupCreature(defaultBody.instantiate(), defaultHead.instantiate());
		add_child(body)
		#add_child(head)
	

func setBody(newBody):
	if body:
		body.queue_free()
	body = newBody

func setHead(newHead):
	if head:
		head.queue_free()

	head = newHead.duplicate();
	add_child(head)
	head.global_position = body.get_node("HeadPos").global_position
	hp = head.hp
	attack = head.attack
	defense = head.defense
	speed = head.speed
	range = head.range


func setupCreature(newbody, newhead):
	setBody(newbody)
	setHead(newhead)

	
	head.global_position = body.get_node("HeadPos").global_position
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
	pass

func doAttack():
	pass
	#head.attack()
