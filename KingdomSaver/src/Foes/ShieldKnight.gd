extends KinematicBody2D

class_name PlayerFoe

#nodes init
onready var game: Battle1 = get_parent()
onready var shield_skill = $Skills/Shield
onready var charge_message =$Charge

#stats
onready var speed = 80
onready var health = 10
onready var movement_delay = 0
onready var movement_timer = 3

func _ready():
	#charge_message.display()
	shield_skill.activate()

func _process(delta):
	if movement_delay < movement_timer:
		movement_delay += delta

func _physics_process(delta):
	if movement_delay > movement_timer:
		_handle_movement(delta)

func _handle_movement(_delta):
	move_and_slide(Vector2(speed,0))
	pass
	
####################destroy#######################
onready var is_destroyed = false
const explosion_scene := preload("res://src/destructables/explosion/Explosion.tscn")
func damage(value: int):
	health -= value
	if (health <= 0):
		destroy()
		
func destroy():
	if (is_destroyed):
		return
	var explosion := explosion_scene.instance()
	explosion.global_position = self.global_position
	get_parent().add_child(explosion)
	is_destroyed = true
	
	game.on_player_death()
	
	queue_free()
	
#######################destroy###################
