extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_node("/root/World").connect("door_open", self, "_open_door")
	$Sprite.play("Closed")
	pass

func _open_door():
	print("opening door")
	$Sprite.play("Open")
