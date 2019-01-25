extends Node2D

export var value = 1
signal get_loot

func _ready():
	get_node("Area2D").connect("body_entered", self, "_get_coin")
	add_to_group("Coins")

func _get_coin(body):
	if body.get_name() == "Player":
		emit_signal("get_loot")
		queue_free()