extends Amalgam_body

@export var speedIncrease = 20.0
@export var damageIncrease = 30.0
func on_attatch(head):
	#reduced attack speed by 20% and increase damage by 30%
	head.speed = head.speed * (1- (speedIncrease * 0.01))
	head.defense = head.defense * (1 + (speedIncrease * 0.01))
	pass
