class_name ShieldSkill
extends Node2D


onready var front = $Sprite
onready var raycast2D = $RayCast2D
onready var Deflector = $Deflector
onready var pointer


onready var max_angle = 0.7
onready var min_angle = -1.5

func _physics_process(_delta):
	raycast2D.cast_to = pointer
	if pointer.angle() <  max_angle and pointer.angle() > min_angle:
		front.rotation = pointer.angle()
	#if raycast2D.cast_to.angle() > max_angle:
		#front.rotation = max_angle
	#if raycast2D.cast_to.angle() < min_angle:
		#front.rotation = min_angle


		


	
