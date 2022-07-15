extends Skill

var Beam = preload("res://src/skills/LaserBeam/Beam.tscn")
# 5 seconds
var cooldown = 5 
var current_cooldown = 0

var max_length = 20

onready var player_sprite := get_node("../../AnimatedSprite")

func activate():
	
	if current_cooldown <= 0 :
		_shoot_laser()
		current_cooldown = cooldown
		
func _physics_process(_delta):
	if current_cooldown > 0:
		current_cooldown -= _delta
		SingletoneStats.set_cooldown1(int(current_cooldown))

func _shoot_laser():
	var laser = Beam.instance()
	
	var rotation_modifier = 1
	if (player_sprite.flip_h):
		rotation_modifier = -1
	
	var pos = position + Vector2(max_length * rotation_modifier, 0)
	laser.position = pos
	
	get_node("../../../Player").add_collision_exception_with(laser)
	get_parent().add_child(laser)
	

func show_cooldown():
	return current_cooldown
