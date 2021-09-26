extends Area2D

var canInteract = false
func _ready():
	$Label.hide()
func _on_doortime_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
func _on_doortime_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		$AudioStreamPlayer.play()
		Transition.change_scene("res://Act1/playerscenes/scene9/SceneNine.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
