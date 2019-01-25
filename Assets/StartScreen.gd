extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if get_tree().paused:
		get_tree().paused = false


func _on_Start_pressed():
	get_tree().change_scene("Stages/World.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("Stages/Instructions.tscn")
