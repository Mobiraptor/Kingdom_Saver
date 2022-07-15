extends StaticBody2D

class_name Destructable

const explosion_scene := preload("res://src/destructables/explosion/Explosion.tscn")

export var start_health := 100
export var score := 100

var is_destroyed := false

onready var singletone_stats := get_node("/root/SingletoneStats") as Stats

onready var health := start_health
onready var sprite := $Sprite

func _ready():
	var sprite_options_number = sprite.hframes * sprite.vframes
	var current_frame = int(floor(rand_range(0, sprite_options_number)))
	sprite.frame = current_frame
	sprite.modulate = Color(1, 1, 1)

func damage(value : int):
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
	singletone_stats.add_score(score)
	is_destroyed = true
	queue_free()
