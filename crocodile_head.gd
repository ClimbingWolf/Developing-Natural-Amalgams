extends Amalgam_head

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
	
func _on_attack_cooldown_timeout() -> void:
	canAttack = true
	pass 
