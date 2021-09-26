extends Area2D

var canInteract = false

func _ready():
	gameSaver.save_game("res://Act4/scene3/scene3.1.after.tscn")
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("act4/scene3/scene3.2.tscn")

func _on_door_body_entered(body):
	if body.name == "player":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true


func _on_door_body_exited(body):
	if body.name == "player":
			$Label.hide()
			canInteract = false
			$AnimatedSprite.stop()
