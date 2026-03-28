extends Amalgam_body

@export var speedIncrease = 50.0

func on_attatch(head):
	#reduced attack speed by 50% or something
	head.speed = head.speed * (1 + (speedIncrease * .01))
	pass
