extends Area2D

export (int) var speed = 50
signal game_over

func _ready():
	add_to_group("Guards")
	pass

func _process(delta):
	get_parent().set_offset(get_parent().get_offset() + speed*delta)
	pass


func _on_Guard_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("game_over")
