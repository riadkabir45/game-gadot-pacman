extends Area2D

var root = null

func _ready():
	root = $".."
	if name == "Portal1":
		root.portal1 = global_position
	if name == "Portal2":
		root.portal2 = global_position
		
func _on_Portal1_body_entered(body):
	if body.name == "Player":
		body.global_position = root.portal2
		


func _on_Portal2_body_entered(body):
	if body.name == "Player":
		body.global_position = root.portal1
