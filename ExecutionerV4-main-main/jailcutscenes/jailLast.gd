extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"IT'S TIME, PRISONER.",
		"LISTEN . . . 161, I AM SORRY ABOUT ALL THIS. REALLY.",
		"I WAS A FAN, YOU KNOW? BUT DON'T TELL THE HIGHER UPS I SAID TOLD YOU THAT.",
		"THEY MIGHT THINK I'M SOME KIND OF EALI SYMPATHIZER.",
		"WELL, I GUESS IT'S ALL IN THE PAST NOW. GET YOURSELF READY.",
		". . . YOU NEED A MINUTE? SURE. WHY NOT?",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false
var doneScene = false

func _ready():
	$Sprite.hide()
	$AnimatedSprite.play("1")
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$"continuesprite".visible = finished
	if doneScene == true:
		Transition.change_scene("res://finalcutscenes/buttonfinal.tscn")
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
		if dialogue_index == 2:
			$AnimatedSprite.play("3")
		if dialogue_index == 3:
			$AnimatedSprite.play("1")
	else:
		doneScene = true
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
