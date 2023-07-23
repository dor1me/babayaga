extends Node2D
class_name Dust

var opacity = 0.7
var radius = 2
var velocity = Vector2(-0.4,0)
func _draw():
	var center = Vector2(0, 0)
	
	var color = Color(0.5, 0.5, 0.5, opacity)

	draw_circle( center, radius, color )

func _process(delta):
	opacity -= 0.2*delta
	radius += 5*delta
	queue_redraw()
	velocity.y += 0.05*delta
	velocity.x += 0.075*delta
	position += velocity
	
	if opacity <= 0.0:
		queue_free()
	pass
