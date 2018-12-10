extends Node

# class member variables go here, for example:
var coins = 0
var loot = 0
export var limit = 0.5
var open = false
signal door_open

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for i in get_children():
		if "Coin" in i.get_name():
			i.connect("get_loot", self, "_get_loot")
			coins += i.value
	pass

func _get_loot():
	loot += 1
	if loot >= (coins*limit) and open != true:
		open = true
		emit_signal("door_open")
