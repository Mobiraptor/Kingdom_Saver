extends ProgressBar


onready var player = get_parent()
onready var CurrVal = player.health

func _ready():
	max_value=player.start_health
	

func _process(delta):
	CurrVal = player.health
	value = CurrVal

