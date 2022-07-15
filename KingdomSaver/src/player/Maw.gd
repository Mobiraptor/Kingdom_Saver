extends Area2D

var damage = 100

func _on_Maw_body_entered(body: Node) -> void:
	if body is Destructable:
		body.damage(damage)
	
	#queue_free()
