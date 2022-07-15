extends KinematicBody2D

class_name Destructable

var velocity = Vector2()
var countdown = 3

#dragon state: awake -> fireball -> prep to fly -> fly up -> fly forward -> -> rotate and fly down -> prep fireball
var state := 0

var direction := 1 # left or right

var FireballVector := Vector2(-164,-50)

#vars for fireball barrage
const barragecd = 0.4
var barcd = 0
var barrage = 0

const FLY_SPEED := -300

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation := $AnimationPlayer
onready var sprite := $AnimatedSprite
onready var time := $Timer
onready var stomp := $Stomp/CollisionShape2D
onready var game: Battle1 = get_parent()

#onready var timerFinish: Timer = get_node("/root/Game/End/timer_delay_finish")

const explosion_scene := preload("res://src/destructables/explosion/Explosion.tscn")
const dragon_breath_scene := preload("res://src/dragon/dragon_breath/DragonBreath.tscn")
const dragon_fireball_scene := preload("res://src/dragon/Fireball/Fireball(projectile).tscn")
export var start_health := 100
onready var health := start_health
var is_destroyed := false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Awake")
	state = 0

func _process(delta):
	handle_barrage()
	handle_bar_cd(delta)
	#fireball_barrage(delta,barrage)

#Set health, laserbeam length and some modifier
func set_stats(s: Vector3):
	start_health = s.x
	health = start_health

func set_position(x: Vector2):
	position = x

func damage(value: int):
	health -= value
	if (health <= 0):
		destroy()
	else:
		var color_value = float(health) / start_health
		
		sprite.modulate = Color(1, color_value, color_value)

func destroy():
	if (is_destroyed):
		return
	var explosion := explosion_scene.instance()
	explosion.global_position = self.global_position
	get_parent().add_child(explosion)
	is_destroyed = true
	
	game.start_countdown()
	
	queue_free()

func _physics_process(delta):
	_handle_state(delta) #dragon state machine
	_handle_movement(delta) #movement

func _handle_change_anim():
	match state:
		0:
			animation.play("Awake")
		1: 
			animation.play("Fireball")
			barrage=4
		_:
			animation.play("Idle")

func create_fireball():
		var dragon_fireball := dragon_fireball_scene.instance()
		dragon_fireball.direction = direction
		dragon_fireball.global_position = self.global_position + FireballVector
		get_parent().add_child(dragon_fireball)

#func fireball_barrage(barrage):
	#barcd=barragecd
		
		

func handle_barrage():
	if barrage>0:
		if barcd==0:
			barcd=barragecd
			create_fireball()
			barrage-=1
	else:
		pass

func handle_bar_cd(delta):
	if barcd>0:
		barcd-=delta
	else:
		barcd=0

func _handle_state(delta):
	countdown -= delta
	if countdown < 0:
		countdown = next_countdown(state)  # need to be next timer	
		state = next_state(state) # next state
		_handle_change_anim() # animation
		
		# do some logic if needed

func next_countdown(this_state):
	match this_state:
		0: # wake up
			return 1
		1: # attack fireball
			return 0.1 
		2: # standing
			return 0.5
		3: # standing, prepare to fly
			return 1
		4: #fly up
			return 2.9
		5: #fly forward
			return 1
		6: #rotate and fly down
			return 1
		7: #standing, prepare fireball
			return 1
		_:
			return 0.01

func next_state(this_state):
	match this_state:
		0: # wake up
			return 1
		1: # attack fireball
			return 2 
		2: # standing
			return 3
		3: # standing, prepare to fly
			barrage=4
			return 4
		4: #fly up
			barrage=4
			return 5
		5: #fly forward
			stomp.disabled = 0
			direction = -direction
			scale.x = -scale.x
			FireballVector.x = -FireballVector.x
			barrage=4
			return 6
		6: #rotate and fly down
			stomp.disabled = 1
			return 7
		7: #standing, prepare fireball
			return 1	
		_:  return 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

			
			
func _handle_movement(delta):
	
	match state:
		4: 
			velocity.y = FLY_SPEED
		5:
			velocity.x = direction * FLY_SPEED
		6:
			velocity.y -= FLY_SPEED * 2 * delta
		_: 
			velocity.y = 0
			velocity.x = 0
			velocity.y -= FLY_SPEED * 2 * delta
	velocity = move_and_slide(velocity, Vector2(0,-1))
