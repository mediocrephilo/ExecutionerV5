extends Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	JailSound.stopsound()
	yield(get_tree().create_timer(3), "timeout")
	Transition.change_scene("res://act3/scene1/act3jailscene1.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
