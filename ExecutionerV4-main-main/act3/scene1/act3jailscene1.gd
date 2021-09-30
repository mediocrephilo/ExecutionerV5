extends Node2D

var yay = false
func _ready():
	JailSound.playsound()
	gameSaver.save_game("res://Act3/scene1/act3jailscene1.tscn")
	$Label2.hide()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and yay == true:
		Transition.change_scene("res://act3/scene2/hallway.tscn")
		JailSound.stopsound()
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	$Label2.show()
	yay = true
