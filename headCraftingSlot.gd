extends HotbarClass

func _ready():
	super._ready()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("click") && !currentHoldChecker  && has_node("Amalgam") && hover && currentHold.name == ""):
		currentHold = $Amalgam;
		currentHoldChecker= true
	if(Input.is_action_just_pressed("click") && currentHoldChecker && !has_node("Amalgam") && hover && currentHold.name == "Amalgam"):
		var dupe = currentHold.duplicate()
		currentHoldChecker =false
		dupe.name = "Amalgam"
		currentHold.queue_free()
		currentHold = Node2D.new();
		add_child(dupe);
	if(has_node("Amalgam") && currentHoldChecker == false):
		#print($Amalgam)
		position_amalgam()
