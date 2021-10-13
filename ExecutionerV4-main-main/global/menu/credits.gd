extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	$People.show()
	$SoundsLinks.hide()
	$SoundsLinks2.hide()
	$Label.hide()
	$AnimatedSprite.show()
	yield(get_tree().create_timer(2), "timeout")
	$Label.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if page == 0:
		$People.show()
		$SoundsLinks.hide()
		$SoundsLinks2.hide()
		$AnimatedSprite2.hide()
		$AnimatedSprite.show()
	if page == 1:
		$People.hide()
		$SoundsLinks.show()
		$SoundsLinks2.hide()
		$AnimatedSprite2.show()
		$AnimatedSprite.show()
	if page == 2:
		$People.hide()
		$SoundsLinks.hide()
		$SoundsLinks2.show()
		$AnimatedSprite2.show()
		$AnimatedSprite.hide()
			
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://global/menu/menu.tscn")
	if Input.is_action_just_pressed("ui_right"):
		if page < 2:
			page += 1
	if Input.is_action_just_pressed("ui_left"):
		if page > 0:
			page -= 1
