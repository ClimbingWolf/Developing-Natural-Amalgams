extends Node

class_name Amalgam_head

#All 10s for default, most likely will need to be changed
@export var hp:int = 10
@export var attack:int = 10
@export var defense:int = 10
@export var speed:float = 10
@export var range:float = 10

var canAttack = false

func _ready() -> void:
	$AttackCooldown.wait_time = speed
	$AttackCooldown.start()
	
func _process(delta: float) -> void:
	if canAttack:
		#if detect enemies inside the collision
		print("attack!!!!")
		do_attack()
		canAttack = false
		$AttackCooldown.start()
	pass

func do_attack():
	print("hi i attacked")
	#basically call enemy takeDamage method and put in the amount of damage
