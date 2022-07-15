extends Area2D


var damage = 1000


func _on_Stomp_body_entered(body):
	if (body is DragonFoe) or(body is PlayerFoe):
		body.damage(damage)
