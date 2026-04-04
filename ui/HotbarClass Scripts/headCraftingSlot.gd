extends HotbarClass

func _ready():
	super._ready()

func _process(delta: float) -> void:
	super._process(delta)

func verifyAmalgamPart(dupe) -> bool:
	return dupe is Amalgam_head
