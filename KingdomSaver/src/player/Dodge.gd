extends Skill

var cooldown = 4 #in sec's
var current_cooldown = 0
var activated = 0
onready var player = get_node("../..")
#onready var layers = collision.get_collision_mask()
#onready var player = get_node("../../player.gd")

signal dodge_over
signal dodge_begins

func _ready():
	pass # Replace with function body.

func activate(): 
	if current_cooldown <= 0 :
		emit_signal("dodge_begins")
		activated = 1
		get_node("../../AnimationPlayer").play("dodge")
		player.set_collision_layer_bit(0,0) #collision diabled when activated
		current_cooldown = cooldown

func _process(delta):
	if current_cooldown > 0: #start cooldown timer
		current_cooldown -= delta
		SingletoneStats.set_cooldown2(int(current_cooldown)) 
	if current_cooldown < 3 and activated == 1:
		activated = 0
		player.set_collision_layer_bit(0,1)
		emit_signal("dodge_over") # emits signal, starting changing player_substate back to idle
		

