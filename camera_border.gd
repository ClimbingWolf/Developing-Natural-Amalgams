extends Node2D
var can_move_cam = true;

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	print("1")
	can_move_cam = false;


func _on_visible_on_screen_notifier_2d_2_screen_entered() -> void:
	print("2")
	can_move_cam = false;



func _on_visible_on_screen_notifier_2d_3_screen_entered() -> void:
	print("3")
	can_move_cam = false;



func _on_visible_on_screen_notifier_2d_4_screen_entered() -> void:
	print("4")
	can_move_cam = false;



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	can_move_cam = true;


func _on_visible_on_screen_notifier_2d_2_screen_exited() -> void:
	can_move_cam = true;


func _on_visible_on_screen_notifier_2d_3_screen_exited() -> void:
	can_move_cam = true;


func _on_visible_on_screen_notifier_2d_4_screen_exited() -> void:
	can_move_cam = true;
