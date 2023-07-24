extends Area2D
class_name Dust

var opacity = 0.7
var radius = 2
var velocity = Vector2(-0.4,0)
var color = Color(0.5, 0.5, 0.5)
var attack = 0.5

@onready var collider = $collider
func _draw():
	var center = Vector2(0, 0)
	draw_circle( center, radius, Color(color, opacity) )

func _process(delta):
	opacity -= 0.1*delta
	radius += 10*delta
	collider.shape.radius = radius
	queue_redraw()
	velocity.y += 0.05*delta
	velocity.x += 0.075*delta
	position += velocity
	
	if opacity <= 0.0:
		queue_free()
	pass


func _on_body_entered(body):
	var enemy = body as BaseEnemy
	if enemy:
		enemy.damage(Vector2(0,0),attack)
		attack = attack / 2
		
	
