extends CanvasLayer

onready var singletone_stats = get_node("/root/SingletoneStats")
onready var points_label := $score_label

func _ready():
	points_label.text = "Ты был побеждён драконом"
	# points_label.text = "Score: " + str(singletone_stats.score)
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	singletone_stats.reset_score()
	get_tree().change_scene("res://src/interface/start_menu/StartMenu.tscn")
	
