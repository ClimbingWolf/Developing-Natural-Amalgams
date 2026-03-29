extends Node2D

class_name enemy

@export var move_speed: float = 50
@export var damage: float = 2
@export var attack_delay: float = 2 #Attack delay, in seconds
@export var HP: float = 10 #I have no clue if this is a good number, 
					#but it's a placeholder

@onready var area: Area2D = $AttackArea
@onready var cooldown: Timer = $AttackCooldown

var canAttack = false

func _ready() -> void:
	cooldown.wait_time = attack_delay
	cooldown.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var areas = area.get_overlapping_areas()
	var moving = true
	for a: Area2D in areas:
		if a.is_in_group("Amalgam"):
			moving = false
			attack(a)
			
		elif a.is_in_group("Enemy"):
			moving = false
			attack(a)
	
	if moving:
		position += Vector2.LEFT * move_speed * delta
	
func attack(area: Area2D):
	if (cooldown.time_left == 0):
		print("ENEMY ATTACK")
		var body: Node2D = area.get_parent()
		body.takeDamage(damage)
		cooldown.start()

func takeDamage(damage):
	HP -= damage
	print("Enemy HP: " + str(HP))
	if (HP <= 0):
		die()
		
func die():
	print("Ow I died")
