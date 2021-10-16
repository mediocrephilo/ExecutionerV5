extends Node2D

func _ready():
	Pariswaltz.playsound()
	RoomSound.playsound()
	gameSaver.save_game("res://act3/scene2/library.tscn")
