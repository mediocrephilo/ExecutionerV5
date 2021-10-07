extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	CitySound.playsound()
	ObstacleSound.playsound()
	gameSaver.save_game("res://Act3/scene5/obstaclecouse.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
