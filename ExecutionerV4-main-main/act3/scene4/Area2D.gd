extends Area2D


var canInteract = false

func _ready():
	$Label.hide()
	gameSaver.save_game("res://act3/scene4/roomEntrance.tscn")
	SewerSound.playsound()
	
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://drawncutscenes/meetingcutscene.tscn")
		SewerSound.stopsound()
		
func _on_Area2D_body_entered(body):
	$Label.show()
	if body.name == "player":
		canInteract = true

func _on_Area2D_body_exited(body):
	$Label.hide()
	if body.name == "player":
		canInteract = false
