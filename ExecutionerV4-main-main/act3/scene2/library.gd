extends Node2D

func _ready():
	RoomSound.playsound()
	gameSaver.save_game("res://Act3/scene2/library.tscn")
