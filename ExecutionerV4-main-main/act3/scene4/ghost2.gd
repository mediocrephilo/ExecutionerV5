extends Area2D

		
func _on_ghost_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://act3/scene4/sewer2.tscn")



