extends Skill

var Shield = preload("res://src/skills/Shield/Shield.tscn")
#var Dragon = preload("res://src/dragon/Dragon.tscn")


onready var pointer = get_node("/root/Game/Dragon")
onready var ShieldUp = Shield.instance()
onready var temp = get_parent()
onready var raycast2D = ShieldUp.get_child(1)






func activate():
	ShieldUp = Shield.instance()
	ShieldUp.pointer = pointer.global_position
	
	
	temp.get_parent().add_collision_exception_with(ShieldUp)
	get_parent().add_child(ShieldUp)
	

func _process(delta):
	if is_instance_valid(ShieldUp) and is_instance_valid(pointer):
		ShieldUp.pointer = pointer.global_position+Vector2(0,-650)
	

func deactivate():	
		ShieldUp.queue_free()
		
