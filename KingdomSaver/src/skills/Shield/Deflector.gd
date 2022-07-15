extends Area2D


func _on_Deflector_body_entered(body):
	
	pass
		
	#if body is Destructable:
		#body.damage(100)


func _on_Deflector_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area is fireball_area:
		area.queue_free()
