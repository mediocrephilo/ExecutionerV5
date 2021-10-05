extends KinematicBody2D

#const ACCEL = 100
#const MAXSPEED = 550
const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	motion.y += 100
	position.x +=15
	$AnimatedSprite.play("walk")
	$Walk.play()
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("down")
		$Walk.stop()

	if is_on_floor():
		$Walk.play()
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2500
			$Walk.stop()
	else:
		if motion.y < 0:
			$AnimatedSprite.play("jump")
			$Walk.stop()
	move_and_slide(motion, UP)
	
