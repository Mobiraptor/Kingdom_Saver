extends CanvasLayer

var rules = 1

var text_1 = "Ты - рыцарь. \nПо слухам, дракон терроризирует местные земли.\nОтправляйся в логово дракону и победи зло.\nИначе королевство погрязнет в хаосе.\n\nПомни, ты не один. Есть и другие рыцари."
var text_help = "WASD / стрелки - хождение \nлевая кнопка мыши - удар \nправая клавиша мыши - выставить щит (когда получен после смерти владельца)\nпробел - перекат\nescape - выход"

# Called when the node enters the scene tree for the first time.
func _ready():
	$rules.text = text_1
	pass # Replace with function body.




func _on_start_button_pressed():
	get_tree().change_scene("res://src/game/Battle1.tscn")


func _on_help_button_pressed():
	if rules == 0:
		$rules.text = text_1
		rules = 1
	else:
		$rules.text = text_help
		rules = 0
