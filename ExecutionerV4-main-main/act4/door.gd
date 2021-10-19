extends Area2D

var canInteract = false
func _ready():
	FactorySound.playsound()
	gameSaver.save_game("res://act4/scene5.tscn")
	Cassysong.playsound()
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act4/cutscene/deathlol.tscn")
		FactorySound.stopsound()
func _on_door_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_door_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.stop()
		canInteract = false
