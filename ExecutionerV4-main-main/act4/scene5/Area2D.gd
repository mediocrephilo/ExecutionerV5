extends Area2D

var canInteract = false
func _ready():
	FactorySound.playsound()
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://act4/scene5/codemachine.tscn")
		
func _on_door2_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_door2_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.stop()
		canInteract = false
