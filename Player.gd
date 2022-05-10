extends KinematicBody2D

var dir = Vector2.ZERO
var speed = 200

func _physics_process(delta):
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move_and_slide(dir*speed)
	pass
