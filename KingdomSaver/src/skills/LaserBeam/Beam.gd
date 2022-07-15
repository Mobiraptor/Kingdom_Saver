class_name Beam
extends Node2D

const DAMAGE_PER_SECOND = 300

var disabled = false

func _ready():
	($Timer as Timer).start()


func disable():
	if disabled:
		return
	disabled = true
	queue_free()

const MAX_LENGTH = 20000

onready var beam = $LaserBeam
onready var raycast2D = $RayCast2D
onready var end = $LaserEnd

func _physics_process(_delta):
	var mouse_position = get_local_mouse_position()
	var max_cast_to = mouse_position.normalized() * MAX_LENGTH
	raycast2D.cast_to = max_cast_to
	if raycast2D.is_colliding():
		var collisionPoint := raycast2D.get_collision_point() as Vector2
		var collider = raycast2D.get_collider()
		end.global_position = collisionPoint
		_damage_colliding_destructables(collider, _delta)
	else:
		end.global_position = raycast2D.cast_to
	beam.rotation = raycast2D.cast_to.angle()
	beam.region_rect.end.x = end.position.length()

func _damage_colliding_destructables(collider, delta):
	if collider is Destructable:
		var destructable := collider as Destructable
		destructable.damage(DAMAGE_PER_SECOND * delta)
	



