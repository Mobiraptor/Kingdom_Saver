extends Label
onready var label = $"."
onready var timer = $Timer
onready var sentense_timer = 0
const sentence_delay = 3



func _ready():
	label.percent_visible = 0
	timer.start()



func _process(delta):
	if label.percent_visible > 0.39 and label.percent_visible < 0.42:
		label.percent_visible += delta * 0.03
		return
	if label.percent_visible < 1:
		label.percent_visible += delta * 0.3
	if get_parent().scale.x<0:
		label.rect_scale.x=label.rect_scale.x*-1



func _on_Timer_timeout():
	queue_free()

