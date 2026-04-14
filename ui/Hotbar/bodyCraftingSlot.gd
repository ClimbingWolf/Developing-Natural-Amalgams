extends HotbarClass

func _ready():
	super._ready()

func _process(delta: float) -> void:
	#If the mouse currently isn't holding anything and the slot is full
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		$Amalgam.queue_free()
		#TODO: refund the cost

func verifyAmalgamPart(dupe) -> bool:
	return dupe is Amalgam_body
