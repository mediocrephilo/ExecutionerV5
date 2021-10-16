extends CanvasLayer

signal scene_changed()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation_player = $AnimationPlayer
onready var black = $Control/Black

# Called when the node enters the scene tree for the first time.

func change_scene(path):
	yield(get_tree().create_timer(0.5), "timeout")
	animation_player.play_backwards("Fade")
	yield(get_tree().create_timer(1), "timeout")
	assert(get_tree().change_scene(path) == OK)
	animation_player.play("Fade")
	yield(get_tree().create_timer(1), "timeout")
	emit_signal("scene_changed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
