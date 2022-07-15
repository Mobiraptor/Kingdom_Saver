extends Node2D


var damage = 20

func _on_Breath_body_entered(body: Node) -> void:
	if body is DragonFoe:
		body.damage(damage)
