extends Control

onready var singletone_stats = get_node("/root/SingletoneStats")

func _ready():
	singletone_stats.connect("update_score", self, "on_update_score")
	singletone_stats.connect("update_time", self, "on_update_time")
	singletone_stats.connect("update_cooldown_ability1",self,"on_update_cooldown_ability1")
	singletone_stats.connect("update_cooldown_ability2",self,"on_update_cooldown_ability2")

func on_update_score(score):
	$ColorRect/points_label.text = "Score: " + str(score)

func on_update_time(time):
	$ColorRect/time_left_label.text = "Time left: " + str(time)

func on_update_cooldown_ability1(time):
	if time > 0:
		$ColorRect/cooldown_ability1_label.text = "Beam: cooldown " + str(time)
	else:
		$ColorRect/cooldown_ability1_label.text = "Bite: Ready"

func on_update_cooldown_ability2(time):
	if time > 0:
		$ColorRect/cooldown_ability2_label.text = "Beam: cooldown " + str(time)
	else:
		$ColorRect/cooldown_ability2_label.text = "Bite: Ready"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
