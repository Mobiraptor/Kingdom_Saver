extends CanvasLayer

onready var singletone_stats = get_node("/root/SingletoneStats")
onready var text_label := $score_label

func _ready():
	text_label.text = "Ты победил дракона, но вдалеке слышен рёв его собрата.\n Готовься!"
	pass 

func _on_Button_pressed():
	singletone_stats.reset_score()
	singletone_stats.buff_dragon()
	
	get_tree().change_scene("res://src/game/Battle1.tscn")
	
