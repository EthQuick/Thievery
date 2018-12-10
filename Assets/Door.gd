extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var open = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#Initialize the door to closed
	get_node("/root/Top").connect("door_open", self, "_open_door")
	$Sprite.play("Closed")
	
	#Set up for moving through the door when it is open
	get_node("Area2D").connect("body_entered", self, "_exit")
	pass

func _open_door():
	#print("opening door")
	$Sprite.play("Open")
	open = true

func _exit(body):
	if open:
		if body.get_name() == "Player":
			#move to next stage
			get_tree().change_scene("Stages/World2.tscn")
