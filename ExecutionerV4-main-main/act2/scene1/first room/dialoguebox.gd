extends Control

var dialogue = [
		"I'M . . . SORRY.",
		". . . IT'S RATHER COLD.",
		"I DON'T FEEL LIKE I SHOULD STICK AROUND MUCH LONGER.",
		"WAIT . . . I FEEL LIKE I HEAR SOMEONE LAUGHING.",
]

var dialogue_index = 0
var number = 0
var finished = true
func _ready():
	$continuesprite.hide()
	load_dialogue()
func _process(delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index < 4:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and dialogue_index >= 4:
		$RichTextLabel.hide()
		$TextureRect.hide()
		$continuesprite.hide()
		$Type.stop()
	if dialogue_index >= 4:
		$continuesprite.hide()
func load_dialogue():
	finished = false;
	$RichTextLabel.show()
	$TextureRect.show()
	$Type.play()
	$RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$RichTextLabel.hide()
		$TextureRect.hide()
		$continuesprite.hide()

func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index += 1

