extends Node2D

class_name enemy

@export var speed = 5
@export var damage = 2
@export var attack_delay = 1 #Attack delay, in seconds
@export var HP = 10 #I have no clue if this is a good number, 
					#but it's a placeholder

@onready var raycast: RayCast2D = $RayCast2D

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not raycast.is_colliding():
		position += Vector2.LEFT * speed * delta
	else:
		var collider = raycast.get_collider()
		attack(collider)

func attack(collider: PhysicsBody2D):
	pass
