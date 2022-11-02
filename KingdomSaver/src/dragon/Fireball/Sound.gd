extends AudioStreamPlayer
#onready var sounds = []
onready var sounds = $".".get_children()


func _ready():
	var numb = RandomNumberGenerator.new()
	var pick = numb.randi_range(0,2)
	sounds[pick].play()



