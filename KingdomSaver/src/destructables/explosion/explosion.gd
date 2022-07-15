extends Node2D

class_name Explosion

const DURATION := 1.0
const NUMBER_OF_FRAMES := 40

var current_time := 0.0

onready var sprite := $Sprite

func _process(delta):
	current_time += delta
	if (current_time > DURATION):
		queue_free()
		return
	sprite.frame = floor(NUMBER_OF_FRAMES * (current_time / DURATION))
	

