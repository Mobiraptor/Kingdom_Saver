extends Node2D

class_name Battle1

onready var singletone_stats = get_node("/root/SingletoneStats")
onready var MusicTimer = $MusicTimer
onready var MusicNode = $Intro
onready var dragon = $Dragon

#onready var Debug_node = get_node("res://src/skills/Shield/Shield.tscn")
#onready var debug_lable = $CanvasLayer/Debug




func _ready():
	#Debug_node.connect()
	#var ShieldKnight = load("res://src/Foes/ShieldKnight.tscn")
	#var knight2 = ShieldKnight.instance()
	#var Dragon = load("res://src/dragon/Dragon.tscn")
	#var dragon = Dragon.instance()
	
	#spawn dragon
	#dragon.set_position(Vector2(-556, 114))
	dragon.set_stats(singletone_stats.get_dragon_stats())
	#add_child(dragon)
	
	#spawn second knight
	#knight2.set_position(Vector2(-1300,164))
	#add_child(knight2)
	
	#start the music!
	#MusicTimer.start(1)
	#$timer_time_left.start(60)
	pass

func starting_scene():
	
	pass

func start_countdown():
	$timer_delay_finish_dragon.start(2)

#func _process(delta):
	#singletone_stats.set_time(int($timer_time_left.time_left))


func _on_timer_time_left_timeout():
	get_tree().change_scene("res://src/interface/end_menu/EndMenu.tscn")

func on_player_death():
	$timer_delay_finish_player.start(2)
	
func _on_timer_delay_finish_player_timeout():
	get_tree().change_scene("res://src/interface/end_menu/EndMenu.tscn")


func _on_timer_delay_finish_dragon_timeout():
	get_tree().change_scene("res://src/interface/middle_menu/MiddleMenu1.tscn")
	



func _on_MusicTimer_timeout():
	MusicNode.play()
