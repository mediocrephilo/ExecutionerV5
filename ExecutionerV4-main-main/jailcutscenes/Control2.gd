extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"HEY, DOZING OFF AGAIN?",
		"CONSIDERING THAT YOU ONLY HAVE TWO DAYS LEFT, YOU MIGHT WANNA BE AWAKE TO TREASURE EVERY MOMENT.",
		"ANYWAYS, I GOT THE PICTURE YOU WANTED."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false
var doneScene = false

func _ready():
	JailSound.playsound()
	Boysong.stopsound()
	$Sprite.hide()
	$AnimatedSprite.play("3")
	load_dialogue()

func _process(_delta):
	if dialogue_index == 3 and Input.is_action_just_pressed("ui_accept") and finished == true:
		Transition.change_scene("res://jailcutscenes/pic.tscn")
	$"continuesprite".visible = finished
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
			$AnimatedSprite.play("2")
		
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1

