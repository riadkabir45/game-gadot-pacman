extends KinematicBody2D

var speed = 2
var nav = null
var line = null

func _ready():
	nav = $".."
	line = $"../Line2D"

func focused_path(array):
	pass

func _physics_process(_delta):
	var nav_array = nav.get_simple_path(global_position,nav.player_pos,false)
	if len(nav_array) == 0:
		return
	
	var dest = Vector2.ZERO

	line.points = nav_array
	
	global_position = global_position.move_toward(nav_array[1],speed)
