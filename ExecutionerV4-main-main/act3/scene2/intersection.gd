extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	RoomSound.playsound()
	Pariswaltz.playsound()
	gameSaver.save_game("res://act3/scene2/intersection.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
