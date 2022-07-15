extends Skill

var Shield = preload("res://src/skills/Shield/Shield.tscn")
#var Dragon = preload("res://src/dragon/Dragon.tscn")


onready var pointer = get_node("../../../Dragon")
onready var ShieldUp = Shield.instance()
onready var temp = get_parent()
onready var raycast2D = ShieldUp.get_child(1)

onready var max_angle = 1.5
onready var min_angle = -1.5





func activate():
	ShieldUp = Shield.instance()
	ShieldUp.pointer = pointer.global_position
	
	temp.get_parent().add_collision_exception_with(ShieldUp)
	get_parent().add_child(ShieldUp)

func _process(delta):
	if is_instance_valid(ShieldUp):
		ShieldUp.pointer = pointer.global_position
	

func deactivate():	
		ShieldUp.queue_free()
		
