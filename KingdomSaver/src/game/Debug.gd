extends Label



func _ready():
	singletone_stats.connect("update_score", self, "on_update_score")


func on_update_score(score):
	$ColorRect/points_label.text = "Score: " + str(score)
