extends Amalgam_head

func _ready() -> void:
	super._ready()
	pass

func do_attack(enemy):
	for i in 3:
		if enemy:
			enemy.get_parent().takeDamage(attack)
			await get_tree().create_timer(.1).timeout
