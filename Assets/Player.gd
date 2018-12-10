extends KinematicBody2D

var motion = Vector2()
var stealth = false
var MAX_SPEED = 100
const ACCELERATION = 25

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, 0.2)
	if Input.is_action_pressed("ui_up"):
		motion.y = max(motion.y - ACCELERATION, -MAX_SPEED)
	elif Input.is_action_pressed("ui_down"):
		motion.y = min(motion.y + ACCELERATION, MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0, 0.2)
	
	if Input.is_action_just_pressed("ui_select"):
		stealth = not stealth
	
	if stealth:
		$Sprite.play("Stealth_Idle")
		MAX_SPEED = 50
	else:
		$Sprite.play("Unstealth_Idle")
		MAX_SPEED = 100
	
	move_and_slide(motion)
	pass
