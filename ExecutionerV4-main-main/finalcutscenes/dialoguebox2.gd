extends Control

func _ready():
	pass
func _process(_delta):
	if Input.is_action_pressed("ui_up"):
		$AudioStreamPlayer.play()
		Transition.change_scene("res://finalcutscenes/final.tscn")
	if Input.is_action_just_pressed("ui_down"):
		Transition.change_scene("res://finalcutscenes/final2.tscn")
