extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	CitySound.playsound()
	gameSaver.save_game("res://act2/scene2/scene2_2.tscn")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
