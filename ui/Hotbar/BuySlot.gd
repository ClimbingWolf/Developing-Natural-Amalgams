extends HotbarClass

@export var productScene:PackedScene
@export var cost = 1
var product
enum modeTypes {HEAD, BODY}
@export var mode = modeTypes.HEAD
var craftingSlotName = "HeadCrafting" #used to get the correct crafting slot to put the amalgam head or body into, since they both use this scriptt

func _ready():
	super._ready()
	product = productScene.instantiate()
	product.name = "Amalgam"
	add_child(product)
	position_amalgam()
	if mode == modeTypes.HEAD:
		craftingSlotName = "HeadCrafting"
	elif mode == modeTypes.BODY:
		craftingSlotName = "BodyCrafting"
	$Cost.text = str(cost)
	

func _process(delta: float) -> void:

	#If the mouse currently isn't holding anything and the slot is full
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		var craftSlot = get_parent().get_parent().get_node("CraftingSlots").get_node(craftingSlotName)
		if craftSlot.has_node("Amalgam"):
			var oldAmalgam = craftSlot.get_node("Amalgam")
			oldAmalgam.name = "Amalgame-Deleting"
			oldAmalgam.queue_free()
		var dupe = product.duplicate()
		dupe.name = "Amalgam"
		craftSlot.add_child(dupe);
		craftSlot.position_amalgam()
		var resultSlot = craftSlot.get_parent().get_node("ResultSlot")
		resultSlot.setupCraft()
		if mode == modeTypes.HEAD:
			resultSlot.headCost = cost
		elif mode == modeTypes.BODY:
			resultSlot.bodyCost = cost
		pass

	
		


	if(has_node("Amalgam") && currentHoldChecker == false):
		#print($Amalgam)
		position_amalgam()
