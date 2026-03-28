extends Node2D

class_name enemy

@export var speed = 5
@export var damage = 2
@export var attack_delay = 1 #Attack delay, in seconds
@export var HP = 10 #I have no clue if this is a good number, 
					#but it's a placeholder

@onready var area: Area2D = $CollisionArea

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var areas = area.get_overlapping_areas()
	var moving = true
	for c: Area2D in areas:
		if c.is_in_group("Creature"):
			moving = false
			#attack
		elif c.is_in_group("Enemy"):
			moving = false
	
	if moving:
		position += Vector2.LEFT * speed * delta
	
func attack(collider: PhysicsBody2D):
	pass

func takeDamage(damage):
	print("Enemy: ow that hurt :(")
