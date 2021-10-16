extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = "text"
var changen = false
var num = 0

func _process(_delta):
	if changen == true:
		$ColorRect.show()
		$AnimatedSprite.show()
		$RichTextLabel.show()
		Boysong.stopsound()
		Cassysong.stopsound()
		CitySound2.stopsound()
		CitySound.stopsound()
		FactorySound.stopsound()
		Girlsong.stopsound()
		HorrorSound.stopsound()
		JailSound.stopsound()
		MilitaryMarch.stopsound()
		ObstacleSound.stopsound()
		Pariswaltz.stopsound()
		RoomSound.stopsound()
		SewerSound.stopsound()
		if num == 0:
			$AudioStreamPlayer.play()
			$AudioStreamPlayer2.play()
			num += 1
		
	if changen == false:
		$ColorRect.hide()
		$AnimatedSprite.hide()
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer2.stop()
		$RichTextLabel.hide()
		if num == 1:
			num = 0
		
	if Input.is_action_just_pressed("ui_select") and changen == true:
		Transition.change_scene(path)
		yield(get_tree().create_timer(1.5), "timeout")
		changen = false
	if Input.is_action_just_pressed("ui_cancel") and changen == true:
		Transition.change_scene("res://global/menu/menu.tscn")
		yield(get_tree().create_timer(1.5), "timeout")
		changen = false
		
func transition(woa):
	path = woa
	
func change(no):
	yield(get_tree().create_timer(1.5), "timeout")
	changen = no
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
