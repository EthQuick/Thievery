extends KinematicBody2D

export (int) var NORM_SPEED = 100
export (int) var TOP_BORD = -32
export (int) var LEFT_BORD = -32
export (int) var RIGHT_BORD = 672
export (int) var BOT_BORD = 384

var motion = Vector2()
var stealth = false
var STEALTH_SPEED = NORM_SPEED * 0.75
var MAX_SPEED = NORM_SPEED 
const ACCELERATION = 25

func _ready():
	get_node("Camera2D").set_limit(MARGIN_TOP, TOP_BORD)
	get_node("Camera2D").set_limit(MARGIN_LEFT, LEFT_BORD)
	get_node("Camera2D").set_limit(MARGIN_RIGHT, RIGHT_BORD)
	get_node("Camera2D").set_limit(MARGIN_BOTTOM, BOT_BORD)

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
		stealth = true
	elif Input.is_action_just_released("ui_select"):
		stealth = false
	
	if stealth:
		$Sprite.play("Stealth_Idle")
		MAX_SPEED = STEALTH_SPEED
	else:
		$Sprite.play("Unstealth_Idle")
		MAX_SPEED = NORM_SPEED
	
	move_and_slide(motion)
	pass
