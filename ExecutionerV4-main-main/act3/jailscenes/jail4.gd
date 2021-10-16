extends Node2D


var yay = false
func _ready():
	JailSound.playsound()
	gameSaver.save_game("res://act3/jailscenes/jail4.tscn")
	$dialoguebox/continuesprite.hide()
	$Label.hide()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and yay == true:
		Transition.change_scene("res://act3/scene5/obstaclecouse.tscn")
		JailSound.stopsound()
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	$Label.show()
	yay = true
