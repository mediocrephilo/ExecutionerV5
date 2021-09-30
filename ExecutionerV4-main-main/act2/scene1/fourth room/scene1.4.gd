extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	CitySound.playsound()
	gameSaver.save_game("res://act2/scene1/fourth room/scene1.4.tscn")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.play()
