extends Area2D



func _on_Area2D2_body_entered(body):
	HorrorSound.fade_out()
	Transition.change_scene("res://Act1/cutscenes/scene4/girltalk.tscn")
