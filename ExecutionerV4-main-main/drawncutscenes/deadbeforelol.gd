extends Node2D

onready var tween_out = get_node("Tween")

export var transition_duration = 2.00
export var transition_type = 1 # TRANS_SINE

func _ready():
	$Audiostreamplayer2.play()
	fade_in()
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://drawncutscenes/deadlol.tscn")
func fade_in():
	# tween music volume down to 0
	$Tween.interpolate_property($AudioStreamPlayer, "volume_db", -80, 0, transition_duration, transition_type, Tween.EASE_IN, 0)
	$Tween.start()
	# when the tween ends, the music will be stopped

func fade_out():
	# tween music volume down to 0
	$Tween.interpolate_property($AudioStreamPlayer, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	$Tween.start()
	# when the tween ends, the music will be stopped
