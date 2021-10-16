extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"IS THIS THE PHOTO YOU ASKED FOR?",
		". . . ",
		"WHO'S THAT GIRL NEXT TO YOU?",
		". . .",
		"ARE YOU GOING TO ANSWER ME?",
		". . .",
		"SUIT YOURSELF THEN ",
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$AnimatedSprite.play("1")
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		if dialogue_index == 7:
			Transition.change_scene("res://act3/initialscenes/title.tscn")
func load_dialogue():
	$Sprite.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		if dialogue_index == 5:
			$AnimatedSprite.play("2")

func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1

