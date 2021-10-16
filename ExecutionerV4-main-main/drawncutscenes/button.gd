extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
	"Before I died . . . the resistance placed bombs around the E.L.F factories.",
	"Seeing as I have the sole detonator, I assume they haven't been blown up yet.",
	"Take it. All you have to do is press the big red button, and everything can come to an end.",
	"Well, maybe not everything. But consequences are something for others to deal with, right?",
	"Maybe this can be your redemption. Maybe not. At least you will have done something."
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


func _on_Control_tree_exited():
	JailSound.stopsound()
	Transition.change_scene("res://act3/jailscenes/black.tscn")
