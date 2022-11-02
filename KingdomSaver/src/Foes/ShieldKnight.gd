extends KinematicBody2D

class_name PlayerFoe

#nodes init
onready var game: Battle1 = get_parent()
onready var shield_skill = $Skills/Shield
onready var charge_message =$Charge
onready var sprite = $AnimatedSprite
onready var dragon = get_node("../Dragon")
onready var ShieldKnight = $"."
onready var Player = get_node("../Player")

#stats
onready var speed = 80
onready var health = 10
onready var movement_timer = 1.5

#flip
onready var flip_timer = 0
const flip_delay = 0.5
onready var turn = -1



func _ready():
	#charge_message.display()
	shield_skill.activate()
	#pass
	
	

func _process(delta):
	if movement_timer > 0: #задержка перед движением рыцаря
		movement_timer -= delta
	if flip_timer > 0:
		flip_timer -= delta #задержка перед поворотом
	if is_instance_valid(dragon):
		_handle_turning(delta)

func _physics_process(delta):
	if movement_timer <= 0:# and flip_timer <= 0:
		move_and_slide(Vector2(speed,0))

######movement#####
func _handle_turning(_delta):
	if dragon.position.x<ShieldKnight.position.x and turn == 1 :
		flip_timer=flip_delay
	if dragon.position.x>ShieldKnight.position.x and turn == -1 :
		flip_timer = flip_delay
	if flip_timer <=0:
		_turning()

func _turning():
	turn*=-1
	speed*=-1
	scale.x*=-1
#####movement#####

#####destroy#####
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
	Player.shield_on = 1
	#game.on_player_death()
	
	queue_free()
	
#####destroy#####
