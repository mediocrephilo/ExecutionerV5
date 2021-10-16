extends Control
var dialogue = [
		". . .  . . .",
		"PRETENTIOUS ASSHOLE",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false

func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()
	yield(get_tree().create_timer(2.0), "timeout")
	load_dialogue()
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
		if dialogue_index == 1:
			Transition.change_scene("res://act3/jailscenes/jailafter.tscn")
		
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
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
	
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
