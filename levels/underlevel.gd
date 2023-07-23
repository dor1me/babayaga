extends Node2D

var dust_class = preload("res://components/dust.tscn")

func _on_button_pressed():
	for i in 50:
		var dust_node = dust_class.instantiate()
		var offset = Vector2(randi()%20-10,randi()%20-10)
		dust_node.velocity = offset*0.05
		dust_node.position = Vector2(600,100)+offset
		get_tree().get_root().add_child(dust_node)
	
	
	
