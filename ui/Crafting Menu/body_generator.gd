extends Node

var bodies = ["res://Amalgam/Scenes/cheetah_body.tscn", "res://Amalgam/Scenes/rhino_body.tscn", "res://Amalgam/Scenes/tardigrade_body.tscn"]
var heads = ["res://Amalgam/Scenes/crocodile_head.tscn", "res://Amalgam/Scenes/giraffe_head.tscn", "res://Amalgam/Scenes/wolf_head.tscn"]
var baseAmalgam = load("res://Amalgam/creature.tscn")
var hotbar: Node2D
var bodies_nodes = [];
var heads_nodes = [];
var active: bool = false
var wait_time = 1.0;
func _ready() -> void:
	hotbar = get_parent().get_node("CanvasLayer").get_node("HeadSlots");
	bodybar = get_parent().get_node("CanvasLayer").get_node("BodySlots");
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
	print("Activate")
	
func add_creature():
	var body = bodies_nodes.pick_random().instantiate()
	body.name = "Amalgam"
	var slots = hotbar.get_node("Slots").get_children()
	for slot in slots:
		if(!slot.has_node("Amalgam")):
			slot.add_child(body);
			slot.position_amalgam()
			break
	


func _on_timer_timeout() -> void:
	print("ASDLJSAJKD")
	add_creature()
	$Timer.wait_time = wait_time
	$Timer.start();
