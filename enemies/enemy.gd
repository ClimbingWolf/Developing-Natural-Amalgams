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
	$TextureProgressBar.value = HP
	cooldown.wait_time = attack_delay
	cooldown.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var areas = $AttackArea.get_overlapping_areas()
	var moving = true
	for a: Area2D in areas:
		if a.is_in_group("Amalgam"):
			moving = false
			attack(a)
			
		#idk why we were making them attack eachother but ok ig
		#elif a.is_in_group("Enemy"):
			#moving = false
			#attack(a)
	
	if moving:
		position += Vector2.LEFT * move_speed * delta
	
func attack(area: Area2D):
	#print(cooldown.time_left)
	if (cooldown.time_left == 0):
		print("ENEMY ATTACK")
		var body: Node2D = area.get_parent()
		print(body.name)
		
		body.takeDamage(damage)
		print(body.hp)
		cooldown.wait_time = attack_delay
		cooldown.start()

func takeDamage(damage):
	HP -= damage
	$TextureProgressBar.value = HP
	print("Enemy HP: " + str(HP))
	if (HP <= 0):
		die()
		
func die():
	queue_free()
	print("Ow I died")
