extends Node

class_name Amalgam_head

#All 10s for default, most likely will need to be changed
@export var hp:int = 10
@export var attack:int = 10
@export var defense:int = 10
@export var speed:float = 2
@export var range:float = 10

var canAttack = false

func _ready() -> void:
	$AttackCooldown.wait_time = speed
	$AttackCooldown.start()
	
func _process(delta: float) -> void:
	if canAttack:
		var potentialEnemies = $AttackArea.get_overlapping_areas()
		for e in potentialEnemies:
			if e.is_in_group("Enemy"):
				do_attack(e)
				canAttack = false
		if !canAttack:
			$AttackCooldown.wait_time = speed;
			$AttackCooldown.start()
			
	pass

func do_attack(enemy):
	print("hi i attacked")
	enemy.get_parent().takeDamage(attack)


func _on_attack_cooldown_timeout() -> void:
	print("evil mode")
	canAttack = true
	pass
