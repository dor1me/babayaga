extends Area2D

func _ready():
	pass 



func _on_body_entered(body):
	if body.name == "player":
		G.goto_level("kolobok")
