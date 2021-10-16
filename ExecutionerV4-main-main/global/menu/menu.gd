extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2), "timeout")
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("one"):
		Transition.change_scene("res://Act1/cutscenes/scene0/InitialCutscene.tscn")
	if Input.is_action_just_pressed("two"):
		Transition.change_scene(gameSaver.load_game())
	if Input.is_action_just_pressed("three"):
		Transition.change_scene("res://global/menu/credits.tscn")
	if Input.is_action_just_pressed("four"):
		Transition.change_scene("res://act2/scene1/first room/scene1_1.tscn")
	if Input.is_action_just_pressed("five"):
		Transition.change_scene("res://act3/scene1/act3jailscene1.tscn")
	if Input.is_action_just_pressed("six"):
		Transition.change_scene("res://drawncutscenes/capture1.tscn")
