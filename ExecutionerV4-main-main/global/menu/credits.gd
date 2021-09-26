extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.hide()
	$People.show()
	$SoundsLinks.hide()
	yield(get_tree().create_timer(3), "timeout")
	$AnimatedSprite.show()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		$People.hide()
		$SoundsLinks.show()
