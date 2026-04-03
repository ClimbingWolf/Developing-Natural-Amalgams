extends HotbarClass

@onready var headCraftingSlot = get_parent().get_node("HeadCrafting")
@onready var bodyCraftingSlot = get_parent().get_node("BodyCrafting")
@onready var baseAmalgam = load("res://Amalgam/creature.tscn")

func _ready():
	super._ready()
	
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		currentHold = $Amalgam;
		currentHoldChecker= true
	#if(Input.is_action_just_pressed("click") && currentHoldChecker && !has_node("Amalgam") && hover && currentHold.name == "Amalgam"):
		#var dupe = currentHold.duplicate()
		#currentHoldChecker =false
		#dupe.name = "Amalgam"
		#currentHold.queue_free()
		#currentHold = Node2D.new();
		#add_child(dupe);
	if headCraftingSlot.has_node("Amalgam") and headCraftingSlot.get_node("Amalgam") is Amalgam_head and bodyCraftingSlot.has_node("Amalgam") && bodyCraftingSlot.get_node("Amalgam") is Amalgam_body:
		var headDupe = headCraftingSlot.get_node("Amalgam").duplicate()
		var bodyDupe = bodyCraftingSlot.get_node("Amalgam").duplicate()
		var creature_copy = baseAmalgam.instantiate();
		creature_copy.setupCreature(bodyDupe, headDupe)
		creature_copy.name = "Amalgam"
		add_child(creature_copy)
		currentHoldChecker =false
		headCraftingSlot.get_node("Amalgam").queue_free()
		bodyCraftingSlot.get_node("Amalgam").queue_free()
		pass
	if(has_node("Amalgam") && currentHoldChecker == false):
		#print($Amalgam)
		position_amalgam()
	
