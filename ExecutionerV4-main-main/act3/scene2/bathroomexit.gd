extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "player":
		$AudioStreamPlayer.play()
		Transition.change_scene("res://act3/scene2/downstairs.tscn")
