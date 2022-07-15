extends Area2D

class_name fireball_area

var damage = 20
var dragon := get_parent()

func _on_FIreball_body_entered(body):
	
		if (body is DragonFoe) or (body is PlayerFoe):
			body.damage(damage)
		
			queue_free() 
			



