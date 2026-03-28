extends Amalgam_head

func _ready() -> void:
	#Set variables here
	pass

func do_attack(enemy):
	enemy.takeDamage(attack)
	await get_tree().create_timer(.1).timeout
	enemy.takeDamage(attack)
	await get_tree().create_timer(.1).timeout
	enemy.takeDamage(attack)
