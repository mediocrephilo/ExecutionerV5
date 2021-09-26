extends Area2D

func _ready():
	$AnimatedSprite.play("default")


func _on_Area2D_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act2/scene4/oshoot.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
