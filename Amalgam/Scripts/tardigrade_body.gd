extends Amalgam_body

@export var hpIncrease = 500
@export var defIncrease = 100

func on_attatch(head):
	head.hp += hpIncrease
	head.defense += defIncrease
	pass
