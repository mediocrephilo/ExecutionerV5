extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(5), "timeout")
	$VideoPlayer.play()
	yield(get_tree().create_timer(79), "timeout")
	$RichTextLabel/AnimationPlayer.play("New Anim")
	$RichTextLabel2/AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(10), "timeout")
	$RichTextLabel4/AnimationPlayer.play("New Anim")
	$RichTextLabel5/AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(13), "timeout")
	$RichTextLabel3/AnimationPlayer.play("New Anim")
	yield(get_tree().create_timer(9), "timeout")
	Transition.change_scene("res://finalcutscenes/conclusion2.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if VideoPlayer.finished
