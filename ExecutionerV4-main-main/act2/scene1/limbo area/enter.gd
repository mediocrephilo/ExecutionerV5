extends Area2D

var canInteract = false
func _ready():
	$Label.hide()

func _on_enter_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true


func _on_enter_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act2/scene1/first room/scene1_1after_fail.tscn")
