extends Control


var dialogue = [
		"STOP. WE'LL REST HERE.",
		"Getting a little worn out, are we? I'll say, if the Eali Corps were full of people like you, it would've made my job much easier.",
		"Oh, don't look at me like that. Although, I suppose it's not a good idea to insult the executioner overseeing my, well, execution . . . ",
		"Not a very talkative one, huh? No matter. It's been a while since I've been able to talk so freely like this. Congragulations on the promotion, by the way.",
		"You know, I think this conversation is going fairly well, all things considered. I have a feeling you and I would've been great friends if, you know, you weren't out to murk me.",
		". . . WHAT IS YOUR NAME?",
		"Oh, this brings me back to-Excuse me?",
		"I ASKED YOU FOR YOUR NAME. THE COUNCILORS CALL YOU TRAITOR, BUT I'M ASSUMING YOU PREFER TO BE CALLED SOMETHING ELSE.",
		". . . And what does my preference matter to an Eali dog?",
		"I . . . I TRY TO REMEMBER MY-THE PRISONERS. IT WOULD BE EASIER TO REMEMBER YOU IF I KNEW YOUR NAME.",
		". . . Ha! Haha-you're rather funny for an executioner, aren't you? Say, why don't you come join us. You must know getting rid of me won't solve anything, right?",
		"SORRY, I'LL HAVE TO PASS.",
		"Well, it was worth a try.",
		". . .  . . .",
		"My name is Paris.",
		"PARIS . . . THE FALLEN PRINCE.",
		"You know your fairy tales, I'm impressed.",
		"I WILL REMEMBER YOU, PARIS . . . TRAITOR.",
		"Well, as long as someone does. I'll hold you to that promise, 161."
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$Sprite2.hide()
	$continuesprite2.hide()
	$continuesprite.hide()
	$RichTextLabel.hide()
	$RichTextLabel2.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue2()

func _process(_delta):
	if dialogue_index == 1 or dialogue_index == 6 or dialogue_index == 8 or dialogue_index == 10 or dialogue_index == 12 or dialogue_index == 16 or dialogue_index == 18:
		$"continuesprite2".visible = finished
	else:
		$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index == 0 or dialogue_index == 5 or dialogue_index == 7 or dialogue_index == 9 or dialogue_index == 11 or dialogue_index == 15 or dialogue_index == 17:
			load_dialogue2()
		else:
			load_dialogue()
		
func load_dialogue():
	$"continuesprite".visible = finished
	$Sprite.show()
	$Sprite2.hide()
	$RichTextLabel.show()
	$RichTextLabel2.hide()
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
	$"continuesprite2".visible = finished
	$Sprite2.show()
	$Sprite.hide()
	$RichTextLabel2.show()
	$RichTextLabel.hide()
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
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
	Transition.change_scene("res://act3/jailscenes/jail5.tscn")
	ForestSound.stopsound()
	HorrorSound.stopsound()
