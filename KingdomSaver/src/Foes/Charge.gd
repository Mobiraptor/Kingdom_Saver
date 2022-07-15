extends Label
onready var label = $"."
onready var sentense_timer = 0
const sentence_delay = 3


func _ready():
	label.percent_visible = 0


func _process(delta):
	if label.percent_visible > 0.237 and label.percent_visible < 0.26:
		label.percent_visible += delta * 0.03
		return
	if label.percent_visible < 1:
		label.percent_visible += delta * 0.3

