extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_pothole_body_entered(body):
	if body.name == "player" and Input.is_action_pressed("ui_down"):
		Transition.change_scene("res://act3/scene4/sewerEntrance.tscn")
