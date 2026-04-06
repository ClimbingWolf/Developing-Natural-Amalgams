extends CanvasLayer

var currentlySelected = null

#TODO make the menu dissapear when clicking out of it
func _ready() -> void:
	hide()

func showMenu():
	show()

func selectCraft():
	#pass the new selection back to the crafter
	pass

func _on_crocodile_pressed() -> void:
	selectCraft()
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Crocodile
	pass # Replace with function body.

func _on_giraffe_pressed() -> void:
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Giraffe
	pass # Replace with function body.


func _on_wolf_pressed() -> void:
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Wolf
	pass # Replace with function body.


func _on_tardigrade_pressed() -> void:
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Tardigrade
	pass # Replace with function body.


func _on_elephant_pressed() -> void:
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Elephant
	pass # Replace with function body.


func _on_cheetah_pressed() -> void:
	if currentlySelected:
		currentlySelected.button_pressed = false
	currentlySelected = $Cheetah
	pass # Replace with function body.
