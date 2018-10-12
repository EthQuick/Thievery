extends Node2D

export var value = 1

func _ready():
	get_parent().coins += value
	get_node("Area2D").connect("body_entered", self, "_get_coin")

func _get_coin(body):
	#print(get_parent().loot)
	get_parent().loot += value
	print(get_parent().loot)
	queue_free()