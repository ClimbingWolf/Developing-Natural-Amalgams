extends Amalgam_head

#so how does this work if it's a head but boosts the attack range?
var canAttack = false

func _ready() -> void:
	$AttackCooldown.wait_time = speed
	$AttackCooldown.start()

func _process(delta: float) -> void:
	if canAttack:
		#if detect enemies inside the collision
		print("attacked!!!!")
		attack()
		canAttack = false
		$AttackCooldown.start()
	pass

func attack():
	print("hi i attacked")
	#basically call enemy takeDamage method and put in the amount of damage
	

func _on_attack_cooldown_timeout() -> void:
	pass # Replace with function body.
