extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Scorelabel.text = str(global.score)
	pass

func show_message(message):
	$Messagelabel.text = message
	$Messagelabel.show()

func update_score(score):
	$Scorelabel.text = str(score)