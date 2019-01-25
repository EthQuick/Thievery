extends Node

# class member variables go here, for example:
var coin_val = 0
var loot = 0
export var limit = 0.5
var open = false
signal door_open
export var next_world = "Stages/World2.tscn"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if get_tree().paused:
		get_tree().paused = false
	var coins = get_tree().get_nodes_in_group("Coins")
	for c in coins:
		c.connect("get_loot", self, "_get_loot")
		coin_val += 1
	var door = get_tree().get_nodes_in_group("Door")
	door[0].connect("next_world", self, "_exit")
	var guards = get_tree().get_nodes_in_group("Guards")
	for g in guards:
		g.connect("game_over", self, "_game_over")
	pass

func _get_loot():
	loot += 1
	global.score += 1
	if loot >= (coin_val*limit) and open != true:
		open = true
		emit_signal("door_open")
	$HUD.update_score(global.score)

func _exit():
	get_tree().change_scene(next_world)

func _game_over():
	$HUD.show_message("Game Over")
	#Wait for a bit then restart
	get_tree().paused = true
	$Game_Over.start()
	yield($Game_Over, "timeout")
	global.score = 0
	get_tree().change_scene("Stages/StartScreen.tscn")
	get_tree().paused = false
