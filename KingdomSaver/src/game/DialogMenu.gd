extends CanvasLayer


func _ready():
	get_tree().paused = true





func _on_No_pressed():
	get_tree().change_scene("res://src/interface/start_menu/StartMenu.tscn")
	get_tree().paused = false
	


func _on_Yes_pressed():
	get_tree().paused = false
	queue_free()
	
