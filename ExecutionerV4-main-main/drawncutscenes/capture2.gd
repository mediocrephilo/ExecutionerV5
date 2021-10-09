extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"EXECUTIONER 161. STATE YOUR PURPOSE.",
		"I HAVE BEEN SENT TO ESCORT THIS PRISONER BACK TO THE CAPITOL, SIR!",
		" . . .  . . .  . . . ",
		"YOU HAVE NOT BEEN AUTHORIZED FOR THIS MISSION. DID THE BUREAU SEND YOU DIRECTLY?",
		"YES SIR! IN LIGHT OF MY . . . RECENT ACHIEVEMENTS, THEY HAVE SENT ME TO ENSURE THE SUCCESSFUL RETURN AND EXECUTION OF THE TRAITOR",
		"THIS IS HIGHLY UNORTHODOX . . . BUT I HAVE HEARD OF YOUR PROMOTION. CONGRAGULATIONS.",
		"YES . . . THANK YOU, SIR.",
		"VERY WELL. TAKE THE TRAITOR AND GO. MAY THE COUNCIL PROTECT US-",
		"-AND OUR LOYALTY GUIDE US."
]

var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$RichTextLabel2.hide()
	$Sprite2.hide()
	$continuesprite2.hide()
	$continuesprite.hide()
	$Sprite.hide()
	$RichTextLabel.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	load_dialogue()

func _process(_delta):
	if dialogue_index == 1 or dialogue_index == 3 or dialogue_index == 4 or dialogue_index == 6 or dialogue_index == 8:
		$"continuesprite".visible = finished
	else:
		$"continuesprite2".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index == 0 or dialogue_index == 2 or dialogue_index == 3 or dialogue_index == 5 or dialogue_index == 7:
			load_dialogue()
		else:
			load_dialogue2()
		if dialogue_index == 9:
			MilitaryMarch.stopsound()
			Transition.change_scene("res://drawncutscenes/caprture3.tscn")
			
func load_dialogue():
	$Sprite.show()
	$Sprite2.hide()
	$RichTextLabel2.hide()
	$RichTextLabel.show()
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
	
	else:
		queue_free()

func load_dialogue2():
	$Sprite2.show()
	$Sprite.hide()
	$RichTextLabel.hide()
	$RichTextLabel2.show()
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel2.show()
		$RichTextLabel2.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel2.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel2, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	print("adsfdgf")
