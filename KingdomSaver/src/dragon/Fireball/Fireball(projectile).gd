extends Node2D

class_name fireball

const DURATION := 3.0 #disappears after that time (sec)
#const FVector = Vector2(-4,1)
var FxVelocity = -4 # Horizontal fireball speed
var FyVelocity = 3 # Vertical fireball speed
var xRand = RandomNumberGenerator.new() #Horizontal direction randomizator
var yRand = RandomNumberGenerator.new()#Vertical direction randomizator



var direction = 1 
var current_time := 0.0

onready var sprite := $Sprite
onready var Fball = get_node(".")

func _ready():
	randoming()
	if (direction == -1):  # direction detection. flip to match dragon sight
		sprite.flip_h = direction
	rotation() 
	if Fball.position[1]<0:
		Fball.rotation_degrees=-90
		FyVelocity=5
		FxVelocity=0
		if (direction == -1):  # direction detection
			Fball.rotation_degrees=90

func rotation(): # поворачивает спрайт так, чтобы он смотрел в ту сторону, в которую летит
	Fball.rotation_degrees=sin(FxVelocity/FyVelocity)*30*+direction
	
func randoming(): # задаёт небольшой разброс, куда полетят файрболы
	#xRand.randomize()
	yRand.randomize()
	#FxVelocity=FxVelocity*xRand.randf_range(0.6,1.4)
	FyVelocity=FyVelocity*yRand.randf_range(0.6,1.4)
	

func _process(delta):  
	current_time += delta # fireball timeout removal func
	if (current_time > DURATION):
		queue_free()
		return

func _physics_process(delta):
	_handle_movement(delta)

func _handle_movement(delta): # change position
	position.x += FxVelocity * direction
	position.y += FyVelocity
	
func _on_FIreball_tree_exited(): # remove fireball when body triggered
	queue_free()
