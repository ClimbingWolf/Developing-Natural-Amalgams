extends Node

var bodies = ["res://Amalgam/Scenes/cheetah_body.tscn", "res://Amalgam/Scenes/rhino_body.tscn", "res://Amalgam/Scenes/tardigrade_body.tscn"]
var heads = ["res://Amalgam/Scenes/crocodile_head.tscn", "res://Amalgam/Scenes/giraffe_head.tscn", "res://Amalgam/Scenes/wolf_head.tscn"]
var baseAmalgam = load("res://Amalgam/creature.tscn")
var hotbar: Node2D
var bodies_nodes = [];
var heads_nodes = [];
var active: bool = false
var wait_time = 3;
func _ready() -> void:
	hotbar = get_parent().get_node("CanvasLayer").get_node("Hotbar");
	for i in bodies:
		bodies_nodes.append(load(i))
	print(bodies_nodes)
	for i in heads:
		heads_nodes.append(load(i))
	
	activate()
	

func activate():
	active = true;
	$Timer.wait_time = wait_time
	$Timer.start();
	
func add_creature():
	var head = heads_nodes.pick_random().instantiate()
	var body = bodies_nodes.pick_random().instantiate()
	var creature_copy = baseAmalgam.instantiate();
	creature_copy.setupCreature(body, head)
	creature_copy.name = "Amalgam"
	var slots = hotbar.get_node("Hotbar nodes").get_children()
	for slot in slots:
		if(!slot.has_node("Amalgam")):
			slot.add_child(creature_copy);
			slot.position_amalgam()
			break
	


func _on_timer_timeout() -> void:
	add_creature()
	$Timer.wait_time = wait_time
	$Timer.start();
