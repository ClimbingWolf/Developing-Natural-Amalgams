extends Node

var bodies = ["res://Amalgam/Scenes/cheetah_body.tscn", "res://Amalgam/Scenes/rhino_body.tscn", "res://Amalgam/Scenes/tardigrade_body.tscn"]
var heads = ["res://Amalgam/Scenes/crocodile_head.tscn", "res://Amalgam/Scenes/giraffe_head.tscn", "res://Amalgam/Scenes/wolf_head.tscn"]
var baseAmalgam = load("res://Amalgam/creature.tscn")
var hotbar: Node2D
var bodybar: Node2D
var bodies_nodes = [];
var heads_nodes = [];
var active: bool = false

@export var wait_time = 5.0; #Wait time for generating a head or body

func _ready() -> void:
	hotbar = get_parent().get_node("HeadSlots");
	bodybar = get_parent().get_node("BodySlots");
	for i in bodies:
		bodies_nodes.append(load(i))
	print(bodies_nodes)
	for i in heads:
		heads_nodes.append(load(i))
	activate()
	add_creature()
	add_creature()
	

func activate():
	active = true;
	$Timer.wait_time = wait_time
	$Timer.start();
	print("Activate")
	
func add_creature():
	var part
	var slots
	var number = randi() % 2 +1
	if number == 1:
		print("body generated")
		part = bodies_nodes.pick_random().instantiate()
		slots = bodybar.get_node("Slots").get_children()
	else:
		print("head generated")
		part = heads_nodes.pick_random().instantiate()
		slots = hotbar.get_node("Slots").get_children()
	part.name = "Amalgam"
	for slot in slots:
		if(!slot.has_node("Amalgam")):
			slot.add_child(part);
			slot.position_amalgam()
			break
	
func _on_timer_timeout() -> void:
	add_creature()
	$Timer.wait_time = wait_time
	$Timer.start();
