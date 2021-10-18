extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("default")
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://global/menu/menu.tscn")
