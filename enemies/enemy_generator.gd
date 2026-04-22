extends Node
@export var enemy: PackedScene

func generate_enemy(hp: float, speed: float, attack: float) -> void:
	var prefab_obj = enemy.instantiate()
	prefab_obj.HP = hp;
	prefab_obj.damage = attack;
	prefab_obj.move_speed = speed;
	add_child(prefab_obj);
