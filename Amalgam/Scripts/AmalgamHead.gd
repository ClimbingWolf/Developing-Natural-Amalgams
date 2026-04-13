extends Node

class_name Amalgam_head

#All 10s for default, most likely will need to be changed
var hp:float = 10
var attack:float = 10
var defense:int = 10
var speed:float = 2
var range:float = 10
var placed = false;

var canAttack = false

@onready var AttackCooldown = get_node("AttackCooldown")

func _ready() -> void:
	AttackCooldown.wait_time = speed
	AttackCooldown.start()
	
func _process(delta: float) -> void:
	if(placed):
		if canAttack:
			var potentialEnemies = $AttackArea.get_overlapping_areas()
			for e in potentialEnemies:
				if e.is_in_group("Enemy"):
					do_attack(e)
					canAttack = false
		if !canAttack && !isWaiting:
			$AttackCooldown.wait_time = speed;
			$AttackCooldown.start()
			isWaiting = true;
				
		pass

func do_attack(enemy):
	print("Amalgam attacked")
	enemy.get_parent().takeDamage(attack)
	canAttack = false;


func _on_attack_cooldown_timeout() -> void:
	canAttack = true
	isWaiting = false;
	pass
