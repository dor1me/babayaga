extends Node2D

var opacity = 0.7
var radius = 2
var velicity = Vector2(-0.4,0)
func _draw():
	var center = Vector2(0, 0)
	
	var color = Color(0.5, 0.5, 0.5, opacity)

	draw_circle( center, radius, color )

func _process(delta):
	opacity -= 0.2*delta
	radius += 5*delta
	queue_redraw()
	velicity.y += 0.05*delta
	velicity.x += 0.075*delta
	position += velicity
	
	if opacity <= 0.0:
		queue_free()
	pass
