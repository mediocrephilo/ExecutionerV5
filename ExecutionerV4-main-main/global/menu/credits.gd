extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var page = 0

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
		if page == 0:
			$People.hide()
			$SoundsLinks.show()
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite2.show()
			page += 1
		if page == 1:
			$People.hide()
			$SoundsLinks.hide()
			$SoundsLinks2.show()
			page += 1
	if Input.is_action_just_pressed("ui_left"):
		if page == 2:
			$SoundsLinks2.hide()
			$SoundsLinks.show()
			$People.hide()
			page -= 1
		if page == 1:
			$SoundsLinks2.hide()
			$SoundsLinks.hide()
			$People.show()
			page -= 1
