extends Control

var dialogue = [
#<<<<<<< HEAD
#=======

		". . . IF IT WASN'T FOR ME, THAT KID WOULD HAVE BEEN SENT TO E.L.F.",
		"IN THE END . . . DIDN'T I SAVE HIM? DIDN'T I PREVENT HIS SUFFERING? . . . HAH.",
		". . . ATLAS, I SOUND LIKE POLLY'S DAD . . .",
		"WHAT AM I THINKING? IT'S JUST A SORRY EXCUSE FOR WHAT I'VE DONE.",
		" . . ."
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 4:
		Transition.change_scene("res://jailcutscenes/jail2.tscn")
		
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
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
