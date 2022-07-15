extends Node
class_name Stats

var score = 0;
var time_left = 60;
var cooldown_ability1 = 0
var cooldown_ability2 = 0

var dragon_health = 500

const dragon_health_buff := 200

signal update_score(points)
signal update_time(time)
signal update_cooldown_ability1(time)
signal update_cooldown_ability2(time)

func _ready():
	pass 

func add_score(points):
	score += points
	emit_signal("update_score", score)

func reset_score():
	score = 0
	emit_signal("update_score", score)

func set_time(time):
	time_left = time
	emit_signal("update_time", time)
	
func set_cooldown1(time):
	cooldown_ability1 = time
	emit_signal("update_cooldown_ability1", cooldown_ability1)

func set_cooldown2(time):
	cooldown_ability2 = time
	emit_signal("update_cooldown_ability2", cooldown_ability2)
	
func buff_dragon():
	dragon_health += dragon_health_buff
	
func get_dragon_stats():
	return Vector3(dragon_health, 1000, 1)
