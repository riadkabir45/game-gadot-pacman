extends KinematicBody2D

var speed = 2
var nav = null
var line = null
var anim_player = null

func _ready():
	nav = $".."
	line = $"../Line2D"
	anim_player = $"AnimationPlayer"

func focused_path(array):
	pass

func _physics_process(_delta):
	var nav_array = nav.get_simple_path(global_position,nav.player_pos,false)
	if len(nav_array) == 0:
		return
	
	var dest = Vector2.ZERO

	line.points = nav_array
	
	global_position = global_position.move_toward(nav_array[1],speed)
	var dir = global_position.move_toward(nav_array[1],speed) - global_position
	if dir == Vector2.ZERO:
		anim_player.stop()
	elif dir.x > 0:
		anim_player.play("FollowRight")
	elif dir.x < 0:
		anim_player.play("FollowLeft")
	elif dir.y > 0:
		anim_player.play("FollowDown")
	elif dir.y < 0:
		anim_player.play("FollowUp")
