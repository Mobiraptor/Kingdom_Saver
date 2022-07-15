extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var damage = 33

func _on_DragonMaw_body_entered(body: Node) -> void:
	if body is DragonFoe:
		body.damage(damage)

