extends KinematicBody2D

var dir = Vector2.ZERO
var speed = 200
var root = null
var anim_player = null

func _ready():
	root = $".."
	anim_player = $AnimationPlayer

func _physics_process(delta):
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move_and_slide(dir*speed)
	root.player_pos = global_position
	if dir == Vector2.ZERO:
		anim_player.stop()
	elif dir.x > 0:
		anim_player.play("Munch_Right")
	elif dir.x < 0:
		anim_player.play("Munch_Left")
	elif dir.y > 0:
		anim_player.play("Munch_Down")
	elif dir.y < 0:
		anim_player.play("Munch_Up")
