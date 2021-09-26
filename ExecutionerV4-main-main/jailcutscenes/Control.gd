extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"RISE AND SHINE, PRISONER",
		"YOU'VE BEEN DRIFTING OFF A LOT LATELY, WHAT'S GOTTEN INTO YOU?",
		"ANYWAYS, I'M HERE TO REMIND YOU THAT YOUR EXECUTION WILL TAKE PLACE THREE DAYS FROM NOW.",
		"...",
		"NOW, BEFORE THAT HAPPENS, DO YOU HAVE ANY FINAL WISHES?",
		"PERHAPS A LAST MEAL REQUEST, A CHANCE TO GO OUTSIDE, ANYTHING REALLY",
		"...",
		"SERIOUSLY? A PHOTO? THAT'S IT?",
		"...",
		"ALRIGHT THEN. TELL ME WHERE IT IS, AND I'LL GIVE IT TO YOU"
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
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
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
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
		if dialogue_index == 7:
			$AnimatedSprite.play("3")
		if dialogue_index == 9:
			$AnimatedSprite.play("2")
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://drawncutscenes/cassy.tscn")
