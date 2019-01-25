extends Area2D

export (int) var speed = 50
export (int) var vis_rad = 50
signal game_over
var target
var rad_color = Color(.876, .91, .247, .1)

func _ready():
	add_to_group("Guards")
	var shape = CircleShape2D.new()
	shape.radius = vis_rad
	$LineofSight/CollisionShape2D.shape = shape
	pass

func _process(delta):
	get_parent().set_offset(get_parent().get_offset() + speed*delta)
	update()
	if target and not target.stealth:
		var space_state = get_world_2d().direct_space_state
		var res = space_state.intersect_ray(position, target.position, [self], collision_mask)
		if res.collider.name == "Player":
			emit_signal("game_over")
	pass

func _draw():
	draw_circle(Vector2(), vis_rad, rad_color)

func _on_Guard_body_entered(body):
	if body.get_name() == "Player":
		emit_signal("game_over")


func _on_LineofSight_body_entered(body):
	if target:
		return
	elif body.get_name() == "Player":
		target = body

func _on_LineofSight_body_exited(body):
	if body == target:
		target = null
