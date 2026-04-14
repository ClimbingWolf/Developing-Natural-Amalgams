extends HotbarClass

@onready var headCraftingSlot = get_parent().get_node("HeadCrafting")
@onready var bodyCraftingSlot = get_parent().get_node("BodyCrafting")
@onready var baseAmalgam = load("res://Amalgam/creature.tscn")

var headCost = 0
var bodyCost = 0
func _ready():
	super._ready()
	
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		if Scores.skulls >= headCost and Scores.bones >= bodyCost:
			var hotbar = get_parent().get_parent().get_parent().get_node("Hotbar")
			var dupe = get_node("Amalgam").duplicate()
			var slots = hotbar.get_node("Hotbar nodes").get_children()
			var added = false
			for slot in slots:
				if(!slot.has_node("Amalgam")):
					slot.add_child(dupe);
					slot.position_amalgam()
					added = true
					break
			if added:
				Scores.skulls -= headCost
				Scores.bones -= bodyCost
				if headCraftingSlot.get_node("Amalgam"):
					headCraftingSlot.get_node("Amalgam").queue_free()
				if bodyCraftingSlot.get_node("Amalgam"):
					bodyCraftingSlot.get_node("Amalgam").queue_free()
				if has_node("Amalgam"):
					get_node("Amalgam").queue_free()
	$CostHead.text = str(headCost)
	$CostBody.text = str(bodyCost)

	if(has_node("Amalgam") && currentHoldChecker == false):
		#print($Amalgam)
		position_amalgam()
	
func setupCraft():
	if (has_node("Amalgam")):
		var amalgamDeleting = get_node("Amalgam")
		amalgamDeleting.name = "Amalgam-Deleting"
		amalgamDeleting.queue_free()
	if headCraftingSlot.has_node("Amalgam") and headCraftingSlot.get_node("Amalgam") is Amalgam_head and bodyCraftingSlot.has_node("Amalgam") && bodyCraftingSlot.get_node("Amalgam") is Amalgam_body:
		var headDupe = headCraftingSlot.get_node("Amalgam").duplicate()
		print("head dupe: " + str(headDupe))
		var bodyDupe = bodyCraftingSlot.get_node("Amalgam").duplicate()
		var creature_copy = baseAmalgam.instantiate();
		headDupe.name = "Head"
		bodyDupe.name = "Body"
		creature_copy.setupCreature(bodyDupe, headDupe)
		creature_copy.name = "Amalgam"
		add_child(creature_copy)
		currentHoldChecker =false
		$CostHead.visible = true
		$CostBody.visible = true
		
		$SkullTile.visible = true
		$BoneTile.visible = true
