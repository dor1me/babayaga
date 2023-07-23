extends Node2D



func _on_button_pressed():
	
	G.generate_dust(50, Vector2(600,100), 1)
	
	G.generate_dust(50, Vector2(600,100), -1)
	
	
