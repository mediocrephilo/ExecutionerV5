extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(92), "timeout")
	$RichTextLabel/AnimationPlayer.play("New Anim")
	$RichTextLabel2/AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(10), "timeout")
	$RichTextLabel3/AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(7), "timeout")
	Transition.change_scene("res://global/menu/menu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if VideoPlayer.finished


#func _on_Timer_timeout():
	#$AudioStreamPlayer.play()
